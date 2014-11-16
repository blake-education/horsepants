require 'horsepants'
require 'tapp'

RSpec.describe Horsepants::Lambdaize do
  module TestMod
    extend Horsepants::Lambdaize

    def its_a_function(x)
      x + 1
    end
  end

  module OtherTestMod
    extend Horsepants::Lambdaize
    def its_a_function(x)
      x.to_s + " one"
    end
  end

  it "works as a function" do
    o = Object.new.tap {|o| o.extend TestMod}
    expect( o.its_a_function(2) ).to eq(3)
  end

  it "lambdaizes function" do
    expect(TestMod.lambdas.its_a_function).to be_an_instance_of(Proc)
  end

  it "is a nice lambda" do
    expect( TestMod.lambdas.its_a_function[1] ).to eq(2)
  end

  it "is another nice lambda" do
    expect( OtherTestMod.lambdas.its_a_function["zero"] ).to eq("zero one")
  end

  it "doesn't lambdaize undefined function" do
    expect { TestMod.lambdas.its_not_a_function }.to raise_error(NameError)
  end
end
