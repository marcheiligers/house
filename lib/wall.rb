require_relative 'repeating_texture_phong_material'

class Wall
  attr_reader :object
  include RepeatingTexturePhongMaterial

  def initialize
    @object = Mittsu::Mesh.new(
      Mittsu::BoxGeometry.new(20.0, 10.0, 0.3),
      material('wall', 'wall_normal')
    )
    @object.position.y = 5
  end
end