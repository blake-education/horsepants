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
    successful = @em.pipe @em.success('x'),
      ->(x) { @em.success('y'+x) }

    expect(successful.value).to eq("yx")
  end

  it "is failure" do
    failure = @em.pipe @em.success('to_fail'),
      ->(x) { @em.success("yay" + x) },
      ->(x) { @em.failure("awww") },
      ->(x) { @em.success("yay again" + x) }

    expect(failure.failure?).to eq(true)
    expect(failure.value).to be_nil
  end


  it "it chains" do
    pipe1 = @em.pipe @em.success('chaining'),
      ->(x) { @em.success("yay" + x) }

    pipe2 = @em.pipe pipe1,
      ->(x) { @em.success("yay2" + x) }

    pipe_fail = @em.pipe pipe2,
      ->(x) { @em.failure("failed") }

    expect(pipe2.value).to eq('yay2yaychaining')

    expect(pipe_fail.value).to be_nil
    expect(pipe_fail.failure?).to eq(true)
  end
end
