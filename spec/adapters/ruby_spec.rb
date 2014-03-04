require 'spec_helper'

describe Sloth::Adapters::Ruby do
  describe '#translate' do
    let(:program)  { described_class.translate 'require "sloth"' }

    it 'should return an instance of Sloth::Nodes::ProgramNode' do
      expect( program ).to be_a(Sloth::Nodes::ProgramNode)
    end
  end
end
