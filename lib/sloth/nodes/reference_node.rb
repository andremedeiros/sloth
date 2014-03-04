module Sloth
  module Nodes
    class ReferenceNode < BaseNode
      attr_accessor :identifier

      def initialize(identifier)
        @identifier = identifier
      end

      def keyword?
        @identifier.type == :keyword
      end

      def constant?
        @identifier.type == :constant
      end
    end
  end
end
