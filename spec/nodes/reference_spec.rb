require 'spec_helper'

describe Nodes::Reference do
  [:keyword, :constant].each do |type|
    describe "##{ type }?" do
      it "should return true when a #{ type } is referenced" do
        ref = described_class.new("SomeRef", type)
        expect( ref.send(:"#{ type }?") ).to be_true
      end

      it "should return false when something else is referenced" do
        ref = described_class.new("SomeRef", :foo)
        expect( ref.send(:"#{ type }?") ).to be_false
      end
    end
  end
end
