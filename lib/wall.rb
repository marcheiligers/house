class Wall
  attr_reader :object

  def initialize
    geometry = Mittsu::BoxGeometry.new(20.0, 10.0, 0.3)
    material = Mittsu::MeshPhongMaterial.new(
      map: Mittsu::ImageUtils.load_texture(File.join(File.dirname(__FILE__), "../textures/wall.png")),
      normal: Mittsu::ImageUtils.load_texture(File.join(File.dirname(__FILE__), "../textures/wall_normal.png"))
    )
    @object = Mittsu::Mesh.new(geometry, material)
    @object.position.y = 5
  end
end