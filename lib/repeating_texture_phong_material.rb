module RepeatingTexturePhongMaterial
  def material(texture, normal)
    Mittsu::MeshPhongMaterial.new(
      map: map(texture),
      normal_map: map(normal)
    )
  end

  private

  def map(filename)
    Mittsu::ImageUtils.load_texture(path(filename)).tap { |t| set_repeat(t) }
  end

  def path(filename)
    File.join(File.dirname(__FILE__), "../textures/#{filename}.png")
  end

  def set_repeat(tex)
    tex.wrap_s = Mittsu::RepeatWrapping
    tex.wrap_t = Mittsu::RepeatWrapping
    tex.repeat.set(10, 10)
  end
end
