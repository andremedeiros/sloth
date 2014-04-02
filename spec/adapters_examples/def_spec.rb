require 'spec_helper'

code = <<-RUBY

def sloth(slothy = false)
  true
end

RUBY

describe humanize_spec(__FILE__) do
  let(:program)  { Adapters.adapter.translate code }
  let(:method)   { program.children.first }
  let(:argument) { method.arguments.first }

  it 'should contain an instance of Sloth::Nodes::Method' do
    expect( method.identifier.name ).to eq('sloth')
  end

  it 'should contain the correct number of arguments' do
    expect( method.arguments.length ).to eq(1)
  end

  it 'the argument should have the correct name' do
    expect( argument.identifier.name ).to eq('slothy')
  end

  it 'the argument should have the correct default value' do
    expect( argument.default ).to be_a(Nodes::Reference)
  end

  it 'the argument should report itself as being a keyword' do
    expect( argument.default.keyword? ).to be_true
  end

  it 'should contain an instance of Sloth::Nodes::Reference' do
    expect( method.children.first ).to be_a(Nodes::Reference)
  end
end
