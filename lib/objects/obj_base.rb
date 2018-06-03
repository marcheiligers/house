require_relative 'base'

class ObjBase < Base
  def self.loader
    @@loader = Mittsu::OBJLoader.new
  end

  def load
    self.class.loader.load("objects/#{name}/#{name}.obj")
  end
end
