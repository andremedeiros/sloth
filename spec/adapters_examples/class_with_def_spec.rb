require 'spec_helper'

code = <<-RUBY

class Shizzle < Nizzle
  def sloth(slothy)
    true
  end
end

RUBY

describe humanize_spec(__FILE__) do
  let(:program) { Sloth::Adapters.adapter.translate code }
  let(:klass)   { program.children.first }

  it 'should contain an instance of Sloth::Nodes::ClassNode' do
    expect( klass ).to be_a(Sloth::Nodes::Klass)
    expect( klass.identifier.name ).to eq('Shizzle')
  end

  it' should contain the right references on the class' do
    expect( klass.identifier.name ).to eq('Shizzle')
    expect( klass.super_identifier.name ).to eq('Nizzle')
  end

  it 'should contain one method node' do
    expect( klass.children.length ).to eq(1)
  end
end
