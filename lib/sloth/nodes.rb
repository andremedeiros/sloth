module Sloth
  module Nodes
    autoload :BaseNode,          "sloth/nodes/base_node"
    autoload :ScopeNode,         "sloth/nodes/scope_node"

    autoload :ClassNode,         "sloth/nodes/class_node"
    autoload :CommandNode,       "sloth/nodes/command_node"
    autoload :IdentifierNode,    "sloth/nodes/identifier_node"
    autoload :MethodNode,        "sloth/nodes/method_node"
    autoload :ParameterNode,     "sloth/nodes/parameter_node"
    autoload :ProgramNode,       "sloth/nodes/program_node"
    autoload :StringLiteralNode, "sloth/nodes/string_literal_node"
    autoload :ReferenceNode,     "sloth/nodes/reference_node"

    NodeError         = Class.new(StandardError)
    NodeNotFoundError = Class.new(NodeError)
  end
end
