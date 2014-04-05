require 'spec_helper'

code = <<-RUBY

some_string = "Hello world"
puts some_string

RUBY

describe humanize_spec(__FILE__) do
  let(:program)  { Adapters.adapter.translate code }
  let(:code)     { 'require "sloth"' }

  context 'the assignment' do
    let(:assignment) { program.children.first }
    it 'should be an instance of Sloth::Nodes::Assignment' do
      expect( assignment ).to be_a(Nodes::Assignment)
    end

    it 'should have the right identifier' do
      expect( assignment.identifier.name ).to eq('some_string')
    end

    it 'should have the right value' do
      expect( assignment.value.value ).to eq('Hello world')
    end
  end

  context 'the reference' do
    let(:command)   { program.children.last }
    let(:reference) { command.arguments.first }

    it 'should be an instance of Sloth::Nodes::Command' do
      expect( command ).to be_a(Nodes::Command)
    end

    it 'should have an argument with an instance of Sloth::Nodes::Reference' do
      expect( reference ).to be_a(Nodes::Reference)
    end

    it 'should reference the correct variable' do
      expect( reference.identifier.name ).to eq('some_string')
    end
  end
end
