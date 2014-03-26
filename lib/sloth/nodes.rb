module Sloth
  module Nodes
    autoload :Base,            "sloth/nodes/base"
    autoload :Command,         "sloth/nodes/command"
    autoload :Identifier,      "sloth/nodes/identifier"
    autoload :Klass,           "sloth/nodes/klass"
    autoload :Method,          "sloth/nodes/method"
    autoload :Parameter,       "sloth/nodes/parameter"
    autoload :Program,         "sloth/nodes/program"
    autoload :Reference,       "sloth/nodes/reference"
    autoload :String,          "sloth/nodes/string"

    NodeError         = Class.new(StandardError)
    NodeNotFoundError = Class.new(NodeError)
  end
end
