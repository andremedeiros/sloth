require 'forwardable'

module Sloth
  module Nodes
    class BaseNode
      extend Forwardable

      attr_accessor :parent
    end
  end
end
