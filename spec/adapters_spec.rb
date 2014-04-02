require 'spec_helper'

describe Sloth::Adapters do
  describe '.adapter' do
    before { stub_const "RUBY_ENGINE", engine }

    context 'with MRI (Ruby or REE)' do
      let(:engine) { 'ruby' }

      it 'should return the correct adapter' do
        expect( described_class.adapter ).to eq(Sloth::Adapters::Ruby)
      end
    end

    context 'with Rubinius' do
      let(:engine) { 'rbx' }

      it 'should return the correct adapter' do
        expect( described_class.adapter ).to eq(Sloth::Adapters::Rubinius)
      end
    end

    after { described_class.instance_variable_set :@adapter, nil }
  end
end
