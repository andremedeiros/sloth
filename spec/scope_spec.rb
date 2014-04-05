require 'spec_helper'

describe Scope do
  let(:scope) { described_class.new }

  before(:each) do
    scope.set(:something, 1)
    scope.push
    scope.set(:something_else, 2)
  end

  context 'pushing and popping' do
    describe '#push' do
      it 'should contain the variables from the parent scope' do
        expect( scope.get(:something) ).to eq(1)
      end

      it 'should set new variables' do
        expect( scope.get(:something_else) ).to eq(2)
      end
    end

    describe '#pop' do
      before { scope.pop }

      it 'should contain the variables from the parent scope' do
        expect( scope.get(:something) ).to eq(1)
      end

      it 'should not contain variables from popped scopes' do
        expect( scope.get(:something_else) ).to be_nil
      end
    end
  end

  context 'getting and setting' do
    describe '#get' do
      it 'should get values from the current scope' do
        expect( scope.get(:something_else) ).to eq(2)
      end

      it 'should get values from the parent scope too' do
        expect( scope.get(:something) ).to eq(1)
      end
    end

    describe '#set' do
      it 'should set variables into the current scope' do
        scope.set(:something_else, 3)
        expect( scope.get(:something_else) ).to eq(3)
      end

      it 'should overwrite variables in the parent scope' do
        scope.set(:something, 2)
        expect( scope.get(:something) ).to eq(2)
      end
    end
  end

  describe '#complete' do
    let(:complete_scope) { scope.complete }

    it 'should return the correct information' do
      expect( complete_scope.get(:something) ).to eq(1)
      expect( complete_scope.get(:something_else) ).to eq(2)
    end
  end

  describe '#current' do
    let(:current_scope) { scope.current }

    it 'should return the correct information' do
      expect( current_scope.get(:something) ).to be_nil
      expect( current_scope.get(:something_else) ).to eq(2)
    end
  end
end
