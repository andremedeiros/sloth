require "sloth/version"

module Sloth
  autoload :Adapters, "sloth/adapters"
  autoload :Checks,   "sloth/checks"
  autoload :Nodes,    "sloth/nodes"
  autoload :Scope,    "sloth/scope"

  def self.adapter
    Adapters.adapter
  end
end
