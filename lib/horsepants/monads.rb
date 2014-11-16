
module Horsepants
  module Monads
    extend self

    autoload :Either, "horsepants/monads/either"

    def monad_pipe(monad, seed, *fns)
      fns.reduce(seed) do |val,fn|
        monad.unit(val).bind(fn)
      end
    end
  end
end
