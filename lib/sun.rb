class Sun
  attr_reader :object

  def initialize
    @object = Mittsu::SpotLight.new(0xffffff, 1.0)
    @object.position.set(0.0, 30.0, -30.0)

    @object.cast_shadow = true
    @object.shadow_darkness = 0.5

    @object.shadow_map_width = 2048
    @object.shadow_map_height = 2048

    @object.shadow_camera_near = 1.0
    @object.shadow_camera_far = 100.0
    @object.shadow_camera_fov = 60.0

    @object.shadow_camera_visible = false
  end
end