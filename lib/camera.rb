class Camera
  extend Forwardable

  def_delegators :@object, :aspect, :get_world_quaternion
  attr_reader :object

  def initialize
    @object = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)
    @object.position.z = 3.0
    @object.position.y = 2.0
    @object.rotation.order = 'YXZ'
  end

  def update_aspect(width, height)
    camera.aspect = width.to_f / height.to_f
    camera.update_projection_matrix
  end

  def rotate(amount)
    object.rotation.y += amount
  end

  def move(amount)
    object.translate_z(-amount)
  end

  def slide(amount)
    object.translate_x(-amount)
  end

  def rise(amount)
    object.translate_y(-amount)
  end

  def lift(amount)
    object.rotation.x += amount
  end
end