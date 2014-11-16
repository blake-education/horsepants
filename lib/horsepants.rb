require "horsepants/version"

module Horsepants
  autoload :Lambdaize, "horsepants/lambdaize"
  autoload :Monads, "horsepants/monads"
  autoload :ModuleExt, "horsepants/core_ext/module"
end

require 'horsepants/extend_module'
