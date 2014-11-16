require 'horsepants'
#Module.send(:include, Horsepants::ModuleExt)

class Module
  def horsepants!
    extend Horsepants::ModuleExt
    extend self
  end
end
