require "sloth/version"

module Sloth
  autoload :Adapters, "sloth/adapters"
  autoload :Nodes,    "sloth/nodes"

  def self.adapter
    Adapters.adapter
  end
end
