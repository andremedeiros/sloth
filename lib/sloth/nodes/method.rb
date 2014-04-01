module Sloth
  module Nodes
    class Method < Scope
      attr_reader :identifier
      attr_reader :arguments

      def initialize(identifier, arguments, children)
        super children

        @identifier = identifier
        @arguments  = arguments
      end
    end
  end
end
