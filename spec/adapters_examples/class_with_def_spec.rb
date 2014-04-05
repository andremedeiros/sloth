require 'spec_helper'

code = <<-RUBY

class Child < Super
  def sloth(slothy)
    true
  end
end

RUBY

describe humanize_spec(__FILE__) do
  let(:program) { Adapters.adapter.translate code }
  let(:klass)   { program.children.first }

  it 'should contain an instance of Sloth::Nodes::ClassNode' do
    expect( klass ).to be_a(Nodes::Klass)
  end

  context 'the identifier reference' do
    let(:identifier_ref) { klass.identifier_ref }
    let(:identifier)     { identifier_ref.identifier }

    it 'should be an instance of Nodes::Sloth::Reference' do
      expect( identifier_ref ).to be_a(Nodes::Reference)
    end

    it 'should contain an identifier' do
      expect( identifier ).to be_a(Nodes::Identifier)
    end

    it 'should contain the correct name' do
      expect( identifier.name ).to eq('Child')
    end
  end

  context 'the super identifier reference' do
    let(:super_identifier_ref) { klass.super_identifier_ref }
    let(:super_identifier)     { super_identifier_ref.identifier }

    it 'should be an instance of Nodes::Sloth::Reference' do
      expect( super_identifier_ref ).to be_a(Nodes::Reference)
    end

    it 'should contain an identifier' do
      expect( super_identifier ).to be_a(Nodes::Identifier)
    end

    it 'should contain the correct name' do
      expect( super_identifier.name ).to eq('Super')
    end
  end
end
