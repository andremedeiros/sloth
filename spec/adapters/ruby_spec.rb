require 'spec_helper'

describe Adapters::Ruby do
  describe '#translate' do
    let(:program)  { described_class.translate 'require "sloth"' }

    it 'should return an instance of Nodes::Program' do
      expect( program ).to be_a(Nodes::Program)
    end
  end
end
