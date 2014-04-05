module Sloth
  module Nodes
    class Method < Scope
      attr_reader :identifier
      attr_reader :parameters

      def initialize(identifier, parameters, children)
        super children

        @identifier = identifier
        @parameters = parameters
      end
    end
  end
end
