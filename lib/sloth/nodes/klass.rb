module Sloth
  module Nodes
    class Klass < Scope
      attr_reader :identifier
      attr_reader :super_identifier

      def initialize(identifier, super_identifier, children)
        super children

        @identifier = identifier
        @super_identifier = super_identifier
      end
    end
  end
end
