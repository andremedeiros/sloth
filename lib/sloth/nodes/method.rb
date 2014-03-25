module Sloth
  module Nodes
    class Method < Command
      attr_reader :children

      def initialize(identifier, arguments, children)
        super(identifier, arguments)
        @children = children
      end
    end
  end
end
