require 'spec_helper'

describe Sloth do
  describe '.adapter' do
    it 'should call Adapters.adapter' do
      expect( Adapters ).to receive(:adapter)
      Sloth.adapter
    end
  end
end
