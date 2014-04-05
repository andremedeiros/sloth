module Sloth
  class Scope
    def initialize
      @stack = [{}]
    end

    def push
      @stack.unshift({})
    end

    def pop
      @stack.shift
    end

    def get(identifier)
      @stack.each do |stack|
        next unless stack.has_key? identifier
        return stack[identifier]
      end

      return nil
    end

    def set(identifier, value)
      @stack.each do |stack|
        next unless stack.has_key? identifier
        return stack[identifier] = value
      end

      @stack.first[identifier] = value
    end
  end
end
