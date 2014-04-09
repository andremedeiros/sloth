require 'spec_helper'

describe Checks::Base do
  let(:instance) { Checks::Base.new([]) }
  describe '#run' do
    it 'should raise a NotImplementedError' do
      expect { instance.run }.to raise_error
    end
  end
end
