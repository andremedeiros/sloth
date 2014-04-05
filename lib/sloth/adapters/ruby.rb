require 'ripper'

module Sloth
  module Adapters
    class Ruby < Ripper::SexpBuilderPP
      def self.translate(src)
        new(src).parse
      end

      def on_program(children)
        Nodes::Program.new(children)
      end

      def on_command(identifier, arguments)
        Nodes::Command.new(identifier, arguments)
      end

      def on_ident(name)
        Nodes::Identifier.new(name)
      end

      def on_string_literal(sexp)
        Nodes::String.new(sexp[1])
      end

      def on_def(identifier, arguments, body)
        Nodes::Method.new(identifier, arguments, body)
      end

      def on_params(required_parameters, optional_parameters, *wat)
        required_parameters ||= []
        optional_parameters ||= []

        parameters = required_parameters + optional_parameters

        parameters.map do |(identifier, value)|
          Nodes::Parameter.new(identifier, value)
        end
      end

      def on_var_ref(reference)
        identifier, type = reference
        Nodes::Reference.new(identifier, type)
      end
      alias_method :on_const_ref, :on_var_ref

      def on_bodystmt(children, *wat)
        children
      end

      def on_kw(keyword)
        [Nodes::Identifier.new(keyword), :keyword]
      end

      def on_const(constant)
        [Nodes::Identifier.new(constant), :keyword]
      end

      def on_class(identifier_ref, super_identifier_ref, children)
        Nodes::Klass.new(identifier_ref, super_identifier_ref, children)
      end

      def on_assign(identifier, value)
        Nodes::Assignment.new(identifier, value)
      end

      # TODO: Make these a helper that defines the methods.
      def on_tstring_content(string)
        string
      end

      def on_var_field(var)
        var
      end

      def on_paren(contents)
        contents
      end

      def on_args_add_block(arguments, wat)
        arguments
      end
    end
  end
end
