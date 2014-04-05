module Sloth
  module Nodes
    # Superclasses
    autoload :Base,  "sloth/nodes/base"
    autoload :Scope, "sloth/nodes/scope"

    # Node classes
    autoload :Assignment, "sloth/nodes/assignment"
    autoload :Command,    "sloth/nodes/command"
    autoload :Identifier, "sloth/nodes/identifier"
    autoload :Klass,      "sloth/nodes/klass"
    autoload :Method,     "sloth/nodes/method"
    autoload :Parameter,  "sloth/nodes/parameter"
    autoload :Program,    "sloth/nodes/program"
    autoload :Reference,  "sloth/nodes/reference"
    autoload :String,     "sloth/nodes/string"

    NodeError         = Class.new(StandardError)
    NodeNotFoundError = Class.new(NodeError)
  end
end
