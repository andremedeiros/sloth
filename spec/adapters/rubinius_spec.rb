require 'spec_helper'

describe Adapters::Rubinius do
  describe '.translate' do
    it 'should not be implemented' do
      expect{ described_class.translate '' }.to raise_error(NotImplementedError)
    end
  end
end
