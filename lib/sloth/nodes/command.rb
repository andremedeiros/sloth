module Sloth
  module Nodes
    class Command < Base
      attr_reader :identifier
      attr_reader :arguments

      def initialize(identifier, arguments)
        @identifier = identifier
        @arguments  = arguments
      end
    end
  end
end
