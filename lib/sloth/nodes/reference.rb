module Sloth
  module Nodes
    class Reference < Base
      attr_reader :identifier
      attr_reader :type

      def initialize(identifier, type)
        @identifier = identifier
        @type = type
      end

      def keyword?
        @type == :keyword
      end

      def constant?
        @type == :constant
      end
    end
  end
end
