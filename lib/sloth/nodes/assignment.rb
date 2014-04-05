module Sloth
  module Nodes
    class Assignment < Base
      attr_reader :identifier
      attr_reader :value

      def initialize(identifier, value)
        @identifier = identifier
        @value      = value
      end
    end
  end
end
