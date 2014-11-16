require 'horsepants'
require 'tapp'

RSpec.describe Horsepants::Monads::Either do
  before do
    @m = Horsepants::Monads
    @em = Horsepants::Monads::Either

  end

  it "units like a motherfucker" do
    expect(@em.unit('x')).to eq(@em.success('x'))
  end

  it "is success" do
    @successful = @em.pipe @em.success('x'),
      ->(x) { @em.success('y'+x) }

    expect(@successful.value).to eq("yx")
  end

  it "is failure" do
    @failure = @em.pipe @em.success('to_fail'),
      ->(x) { @em.success("yay" + x) },
      ->(x) { @em.failure("awww") },
      ->(x) { @em.success("yay again" + x) }

    expect(@failure.failure?).to eq(true)
    expect(@failure.value).to be_nil
  end
end
