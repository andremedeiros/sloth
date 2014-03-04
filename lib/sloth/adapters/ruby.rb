require 'ripper'

module Sloth
  module Adapters
    module Ruby
      def self.translate(code)
        sexp = Ripper.sexp code

        build_ast sexp
      end

      def self.build_ast(sexp)
        case sexp[0]
        when :program then
          children = sexp[1].map { |c| build_ast(c) }
          Sloth::Nodes::ProgramNode.new children

        when :command then
          identifier = build_ast(sexp[1])

          arguments_block = sexp[2]
          arguments = arguments_block[1].map { |a| build_ast(a) }

          Sloth::Nodes::CommandNode.new identifier, arguments

        when :string_literal then
          content = sexp[1][1][1]
          Sloth::Nodes::StringLiteralNode.new content

        when :def then
          identifier = build_ast(sexp[1])

          params_block = sexp[2]
          params_block = params_block[1] if params_block[0] == :paren

          params = ((params_block[1] || []) + (params_block[2] || [])).map do |param|
            param = [param] unless param[0].is_a? Array

            param_identifier = build_ast(param[0])
            param_default    = build_ast(param[1]) if param[1]

            Sloth::Nodes::ParameterNode.new param_identifier, param_default
          end

          children = sexp[3][1].map { |c| build_ast(c) }
          Sloth::Nodes::MethodNode.new identifier, params, children

        when :@ident, :@const, :@kw then
          type = case sexp[0]
          when :@ident then :identifier
          when :@kw    then :keyword
          when :@const then :constant
          end
          Sloth::Nodes::IdentifierNode.new sexp[1], type

        when :var_ref, :const_ref then
          identifier = build_ast(sexp[1])

          Sloth::Nodes::ReferenceNode.new identifier

        when :class then
          identifier = build_ast(sexp[1])
          ancestor_identifier = build_ast(sexp[2]) if sexp[2]
          children = sexp[3][1].map { |c| build_ast(c) }

          Sloth::Nodes::ClassNode.new identifier, ancestor_identifier, children

        else raise Sloth::Nodes::NodeNotFoundError, sexp[0]
        end
      end
    end
  end
end
