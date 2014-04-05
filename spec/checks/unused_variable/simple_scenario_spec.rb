require 'spec_helper'

code = <<-RUBY

greeting = "Hello world!"
puts 1 + 2

RUBY

describe humanize_checker_spec(__FILE__) do
  let(:program) { Adapters.adapter.translate code }
  let(:checker) { Checks::UnusedVariable.new(program) }

  before { checker.run }

  it 'should contain one error' do
    expect( checker.errors.length ).to eq(1)
  end
end
