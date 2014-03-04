module Sloth
  module Nodes
    class ParameterNode < BaseNode
      attr_accessor :identifier, :default

      def initialize(identifier, default = nil)
        @identifier = identifier
        @default    = default
      end

      def default?
        !!@default
      end
    end
  end
end
