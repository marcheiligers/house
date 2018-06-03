# export MITTSU_LIBGLFW_FILE=libglfw.3.dylib
require 'mittsu'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

require_relative 'lib/world'
require_relative 'lib/sky'
require_relative 'lib/ambient'
require_relative 'lib/sun'
require_relative 'lib/camera'
require_relative 'lib/wall'
require_relative 'lib/objects/couch'

world = World.new(ASPECT)
sky = Sky.new(ASPECT)

# world.add(Couch.new)

world.add(Ambient.new)
world.add(Sun.new)
world.add(Wall.new)


camera = Camera.new
world.add(camera)

left_stick = Mittsu::Vector2.new
right_stick = Mittsu::Vector2.new

JOYSTICK_DEADZONE = 0.1
JOYSTICK_SENSITIVITY = 0.05

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: 'House'
renderer.auto_clear = false
renderer.shadow_map_enabled = true
renderer.shadow_map_type = Mittsu::PCFSoftShadowMap

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.update_aspect(width, height)
  sky.camera.aspect = camera.aspect
  sky.camera.update_projection_matrix
end

renderer.window.run do
  # if renderer.window.key_down?(GLFW_KEY_A)
  #   turn_tank(tank, camera, JOYSTICK_SENSITIVITY)
  # end
  # if renderer.window.key_down?(GLFW_KEY_D)
  #   turn_tank(tank, camera, -JOYSTICK_SENSITIVITY)
  # end
  if renderer.window.key_down?(GLFW_KEY_LEFT)
    camera.rotate(JOYSTICK_SENSITIVITY)
  end
  if renderer.window.key_down?(GLFW_KEY_RIGHT)
    camera.rotate(-JOYSTICK_SENSITIVITY)
  end
  if renderer.window.key_down?(GLFW_KEY_W)
    camera.move(JOYSTICK_SENSITIVITY)
  end
  if renderer.window.key_down?(GLFW_KEY_S)
    camera.move(-JOYSTICK_SENSITIVITY)
  end
  if renderer.window.key_down?(GLFW_KEY_Q)
    camera.rise(JOYSTICK_SENSITIVITY)
  end
  if renderer.window.key_down?(GLFW_KEY_E)
    camera.rise(-JOYSTICK_SENSITIVITY)
  end
  if renderer.window.key_down?(GLFW_KEY_A)
    camera.slide(JOYSTICK_SENSITIVITY)
  end
  if renderer.window.key_down?(GLFW_KEY_D)
    camera.slide(-JOYSTICK_SENSITIVITY)
  end
  if renderer.window.key_down?(GLFW_KEY_UP)
    camera.lift(-JOYSTICK_SENSITIVITY)
  end
  if renderer.window.key_down?(GLFW_KEY_DOWN)
    camera.lift(JOYSTICK_SENSITIVITY)
  end

  sky.camera.quaternion.copy(camera.get_world_quaternion)

  renderer.clear
  renderer.render(sky.scene, sky.camera);
  renderer.clear_depth
  renderer.render(world.scene, camera.object)
end
