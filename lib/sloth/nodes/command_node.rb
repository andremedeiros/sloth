module Sloth
  module Nodes
    class CommandNode < BaseNode
      attr_accessor :identifier, :arguments

      def initialize(identifier, arguments)
        @identifier = identifier
        @arguments  = arguments
      end
    end
  end
end
