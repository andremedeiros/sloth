module Sloth
  module Checks
    class UnusedVariable < Base
      def initialize(program)
        super
        @scope = Scope.new
      end

      def run(parent = nil)
        parent ||= @program
        @scope.push

        # Go through the children.
        parent.children.each do |child|
          case child
          when Nodes::Scope
            run(child)
          when Nodes::Assignment
            add_assignment(child)
          when Nodes::Command
            check_references(child)
          end
        end

        @scope.current.to_h.each do |name, references|
          @errors << name if references == 0
        end

        @scope.pop
      end

      def add_assignment(assignment)
        name = assignment.identifier.name
        @scope.set(name, 0) if !@scope.get(name)
      end

      def check_references(command)
        command.arguments.each do |argument|
          next unless argument.is_a?(Nodes::Reference)
          next unless argument.variable?

          name = argument.identifier.name
          @scope.set(name, @scope.get(name) + 1)
        end
      end
    end
  end
end
