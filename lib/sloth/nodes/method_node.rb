module Sloth
  module Nodes
    class MethodNode < ScopeNode
      attr_accessor :identifier, :arguments

      def initialize(identifier, arguments, children)
        super children

        @identifier = identifier
        @arguments  = arguments
      end
    end
  end
end
