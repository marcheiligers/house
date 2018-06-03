require_relative 'base'

# NOTE: There is no FBXLoader :-(

class FbxBase < Base
  def self.loader
    @@loader = Mittsu::FBXLoader.new
  end

  def load
    self.class.loader.load("objects/#{name}/#{name}.fbx")
  end
end
