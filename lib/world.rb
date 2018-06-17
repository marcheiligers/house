require_relative 'repeating_texture_phong_material'

class World
  attr_reader :scene

  include RepeatingTexturePhongMaterial

  def initialize(aspect)
    @scene = Mittsu::Scene.new
    create
  end

  def add(obj)
    @scene.add(obj.object)
  end

  private

  def create
    floor = Mittsu::Mesh.new(
      Mittsu::BoxGeometry.new(1.0, 1.0, 1.0),
      material('grass_mixed_flowers_01_B', 'grass_mixed_flowers_01_N')
    )
    floor.scale.set(10000.0, 10.0, 10000.0)
    floor.position.y = -5.0
    scene.add(floor)
  end
end