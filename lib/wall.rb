class Wall
  attr_reader :object

  def initialize
    geometry = Mittsu::BoxGeometry.new(20.0, 10.0, 0.3)
    material = Mittsu::MeshBasicMaterial.new(color: 0x333333)
    @object = Mittsu::Mesh.new(geometry, material)
    @object.position.y = 5
  end
end