module Sloth
  module Nodes
    class Klass < Scope
      attr_reader :identifier_ref
      attr_reader :super_identifier_ref

      def initialize(identifier_ref, super_identifier_ref, children)
        super children

        @identifier_ref = identifier_ref
        @super_identifier_ref = super_identifier_ref
      end
    end
  end
end
