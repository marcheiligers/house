class Sky
  attr_reader :scene, :camera

  def initialize(aspect)
    @scene = Mittsu::Scene.new
    @camera = Mittsu::PerspectiveCamera.new(75.0, aspect, 1.0, 100.0)
    create
  end

  private

  def create
    shader = Mittsu::ShaderLib[:cube]
    shader.uniforms['tCube'].value = cube_map_texture

    material = Mittsu::ShaderMaterial.new(
      fragment_shader: shader.fragment_shader,
      vertex_shader: shader.vertex_shader,
      uniforms: shader.uniforms,
      depth_write: false,
      side: Mittsu::BackSide
    )

    skybox = Mittsu::Mesh.new(Mittsu::BoxGeometry.new(100, 100, 100), material)
    scene.add(skybox)
  end

  def cube_map_texture
    Mittsu::ImageUtils.load_texture_cube(
      %w[rt lf up dn bk ft].map do |name|
        File.join(File.dirname(__FILE__), "../textures/alpha-island_#{name}.png")
      end
    )
  end
end