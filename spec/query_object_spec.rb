require 'horsepants'
require 'tapp'

RSpec.describe 'integration' do
  module QueryStudent
    horsepants!

    ns either: 'Horsepants::Monads::Either'

    def hello(x)
      "hello #{x}"
    end
  end

  it "is autolambdad" do
    expect(QueryStudent.lambdas.hello['world']).to eq('hello world')
  end

  it "has namespaced things" do
    expect(QueryStudent.either).to eq(Horsepants::Monads::Either)
  end

  it "extends self" do
    expect(QueryStudent.hello('mars')).to eq('hello mars')
  end
end
