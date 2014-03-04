module Sloth
  module Nodes
    class StringLiteralNode < BaseNode
      attr_accessor :content

      def initialize(content)
        @content = content
      end
    end
  end
end
