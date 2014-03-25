module Sloth
  module Nodes
    class Parameter < Base
      attr_reader :identifier
      attr_reader :default

      def initialize(identifier, default)
        @identifier = identifier
        @default = default
      end
    end
  end
end
