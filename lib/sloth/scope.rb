module Sloth
  class Scope
    def initialize(stack = {})
      @stacks = [stack]
    end

    def push
      @stacks.unshift({})
    end

    def pop
      @stacks.shift
    end

    def get(identifier)
      @stacks.each do |stack|
        next unless stack.has_key? identifier
        return stack[identifier]
      end

      return nil
    end

    def set(identifier, value)
      @stacks.each do |stack|
        next unless stack.has_key? identifier
        return stack[identifier] = value
      end

      @stacks.first[identifier] = value
    end

    def complete
      Scope.new(to_h)
    end

    def current
      Scope.new(@stacks.first)
    end

    def to_h
      ({}).tap do |result|
        @stacks.each { |stack| result.merge!(stack) }
      end
    end
  end
end
