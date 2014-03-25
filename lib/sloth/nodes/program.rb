module Sloth
  module Nodes
    class Program < Base
      attr_reader :children

      def initialize(children)
        @children = children
      end
    end
  end
end
