module Sloth
  module Nodes
    class ScopeNode < BaseNode
      attr_accessor :children

      def initialize(children)
        @children = children

        set_parent_on_children!
      end

    private
      def set_parent_on_children!
        @children.each { |child| child.parent = self }
      end
    end
  end
end
