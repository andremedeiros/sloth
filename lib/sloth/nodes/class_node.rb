module Sloth
  module Nodes
    class ClassNode < ScopeNode
      attr_accessor :identifier, :ancestor_identifier

      def initialize(identifier_ref, ancestor_identifier_ref, children)
        super children

        @identifier_ref          = identifier_ref
        @ancestor_identifier_ref = ancestor_identifier_ref
      end

      def_delegator :@identifier_ref,          :identifier
      def_delegator :@ancestor_identifier_ref, :identifier, :ancestor_identifier

      def method_nodes
        @children.select { |child| child.is_a? MethodNode }
      end
    end
  end
end
