module Sloth
  module Adapters
    autoload :Rubinius, "sloth/adapters/rubinius"
    autoload :Ruby,     "sloth/adapters/ruby"

    AdapterError         = Class.new(StandardError)
    AdapterNotFoundError = Class.new(AdapterError)

    def self.adapter
      @adapter ||= begin
        case RUBY_ENGINE
        when 'rbx'  then Rubinius
        when 'ruby' then Ruby
        else raise AdapterNotFoundError
        end
      end
    end
  end
end
