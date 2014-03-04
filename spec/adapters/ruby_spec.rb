require 'spec_helper'

describe Sloth::Adapters::Ruby do
  describe '#translate' do
    let(:program)  { described_class.translate code }

    context 'require "sloth"' do
      let(:code) { 'require "sloth"' }
      let(:command) { program.children.first }

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

    context 'def sloth(slothy = false) true; end' do
      let(:code) { 'def sloth(slothy = false) true; end' }
      let(:method) { program.children.first }
      let(:argument) { method.arguments.first }

      it 'should contain an instance of Sloth::Nodes::Method' do
        expect( method.identifier.value ).to eq('sloth')
      end

      it 'should contain the correct number of arguments' do
        expect( method.arguments.length ).to eq(1)
      end

      it 'the argument should have the correct name' do
        expect( argument.identifier.value ).to eq('slothy')
      end

      it 'the argument should have the correct default value' do
        expect( argument.default ).to be_a(Sloth::Nodes::ReferenceNode)
      end

      it 'the argument should report itself as being a keyword' do
        expect( argument.default.keyword? ).to be_true
      end

      it 'should contain an instance of Sloth::Nodes::VariableReference' do
        expect( method.children.first ).to be_a(Sloth::Nodes::ReferenceNode)
      end
    end

    context 'class Shizzle < Nizzle; def sloth(slothy) true; end; end' do
      let(:code) { 'class Shizzle < Nizzle; def sloth(slothy) true; end; end' }
      let(:klass) { program.children.first }

      it 'should contain an instance of Sloth::Nodes::ClassNode' do
        expect( klass ).to be_a(Sloth::Nodes::ClassNode)
        expect( klass.identifier.value ).to eq('Shizzle')
      end

      it' should contain the right references on the class' do
        expect( klass.identifier.value ).to eq('Shizzle')
        expect( klass.ancestor_identifier.value ).to eq('Nizzle')
      end

      it 'should contain one method node' do
        expect( klass.method_nodes.length ).to eq(1)
      end
    end
  end
end
