require 'spec_helper'

code = <<-RUBY

def sloth(slothy = false)
  true
end

RUBY

describe humanize_spec(__FILE__) do
  let(:program)  { Adapters.adapter.translate code }
  let(:method)   { program.children.first }

  context 'the method' do
    it 'should be an instance of Sloth::Nodes::Method' do
      expect( method ).to be_a(Nodes::Method)
    end

    it 'should contain the correct information' do
      expect( method.identifier.name ).to eq('sloth')
    end

    it 'should contain the correct number of arguments' do
      expect( method.parameters.length ).to eq(1)
    end

    it 'should contain an instance of Sloth::Nodes::Reference' do
      expect( method.children.first ).to be_a(Nodes::Reference)
    end
  end

  context 'the parameter' do
    let(:parameter) { method.parameters.first }

    it 'should be an instance of Sloth::Nodes::Parameter' do
      expect( parameter ).to be_a(Nodes::Parameter)
    end

    it 'should have the correct name' do
      expect( parameter.identifier.name ).to eq('slothy')
    end

    it 'should have the correct default value' do
      expect( parameter.default ).to be_a(Nodes::Reference)
    end

    it "the default value should report itself as being a keyword" do
      expect( parameter.default.keyword? ).to be_true
    end
  end
end
