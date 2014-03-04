module Sloth
  module Nodes
    class IdentifierNode < BaseNode
      attr_accessor :value, :type

      def initialize(value, type)
        @value = value
        @type  = type
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
