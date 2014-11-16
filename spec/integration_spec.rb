require 'horsepants'
require 'tapp'

RSpec.describe 'integration' do
  module Thing
    extend Horsepants::Lambdaize
    def thing(x)
      x + 'y'
    end
  end

  it "integrates" do
    e = Horsepants::Monads::Either
    result = e.pipe e.success('input'), Thing.lambdas.thing
    expect(result.value).to eq('inputy')

    result = e.pipe 'input2', Thing.lambdas.thing
    expect(result.value).to eq('input2y')
  end
end

