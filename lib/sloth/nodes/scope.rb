module Sloth
  module Nodes
    class Scope < Base
      attr_reader :children

      def initialize(children)
        @children = children

        # Set the parent on each child.
        @children.each { |child| child.parent = self }
      end
    end
  end
end
