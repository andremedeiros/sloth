module Sloth
  module Nodes
    class String < Base
      attr_reader :value

      def initialize(value)
        @value = value
      end
    end
  end
end
