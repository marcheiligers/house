class World
  attr_reader :scene

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
      Mittsu::MeshPhongMaterial.new(
        map: map('desert'),
        normal_map: map('desert-normal')
      )
    )
    floor.scale.set(10000.0, 10.0, 10000.0)
    floor.position.y = -5.0
    scene.add(floor)
  end

  def map(filename)
    Mittsu::ImageUtils.load_texture(path(filename)).tap { |t| set_repeat(t) }
  end

  def path(filename)
    File.join(File.dirname(__FILE__), "../textures/#{filename}.png")
  end

  def set_repeat(tex)
    tex.wrap_s = Mittsu::RepeatWrapping
    tex.wrap_t = Mittsu::RepeatWrapping
    tex.repeat.set(1000, 1000)
  end
end