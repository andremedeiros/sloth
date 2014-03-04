require 'spec_helper'

code = <<-RUBY

require "sloth"

RUBY

describe humanize_spec(__FILE__) do
  let(:program)  { Sloth::Adapters.adapter.translate code }
  let(:code)     { 'require "sloth"' }
  let(:command)  { program.children.first }

  it 'should return an instance of Sloth::Nodes::Program' do
    expect( program ).to be_a(Sloth::Nodes::ProgramNode)
  end

  it 'should contain an instance of Sloth::Nodes::Command' do
    expect( command.identifier.value ).to eq('require')
  end

  it 'the command node should have the program node as its parent' do
    expect( command.parent ).to eq(program)
  end

  it "the command's arguments should contain one element" do
    expect( command.arguments.length ).to eq(1)
  end

  it 'should contain an argument of type Sloth::Nodes::StringLiteral' do
    argument = command.arguments.first
    expect( argument ).to be_a(Sloth::Nodes::StringLiteralNode)
    expect( argument.content ).to eq('sloth')
  end
end
