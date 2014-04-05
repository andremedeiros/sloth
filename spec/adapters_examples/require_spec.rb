require 'spec_helper'

code = <<-RUBY

require "sloth"

RUBY

describe humanize_spec(__FILE__) do
  let(:program)  { Adapters.adapter.translate code }
  let(:command)  { program.children.first }

  context 'the program' do
    it 'should be an instance of Sloth::Nodes::Program' do
      expect( program ).to be_a(Nodes::Program)
    end
  end

  context 'the command' do
    it 'should be an instance of Sloth::Nodes::Command' do
      expect( command ).to be_a(Nodes::Command)
    end

    it 'should contain the correct information' do
      expect( command.identifier.name ).to eq('require')
    end

    it 'should have the program as its parent' do
      expect( command.parent ).to eq(program)
    end

    it "the command's arguments should contain one element" do
      expect( command.arguments.length ).to eq(1)
    end
  end

  context 'the argument' do
    let(:argument) { command.arguments.first }

    it 'should be an instance of Sloth::Nodes::String' do
      expect( argument ).to be_a(Nodes::String)
    end

    it 'should contain the correct information' do
      expect( argument.value ).to eq('sloth')
    end
  end
end
