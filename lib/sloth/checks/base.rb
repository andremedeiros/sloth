module Sloth
  module Checks
    class Base
      attr_reader :errors

      def initialize(program)
        @program = program
        @errors  = []
      end

      def run
        raise NotImplementedError
      end
    end
  end
end
