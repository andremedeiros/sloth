module Sloth
  module Nodes
    class Reference < Base
      attr_reader :name
      attr_reader :type

      def initialize(name, type)
        @name = name
        @type = type
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
