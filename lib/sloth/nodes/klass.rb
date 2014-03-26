module Sloth
  module Nodes
    class Klass < Base
      attr_reader :identifier
      attr_reader :super_identifier
      attr_reader :children

      def initialize(identifier, super_identifier, children)
        @identifier = identifier
        @super_identifier = super_identifier
        @children = children
      end
    end
  end
end
