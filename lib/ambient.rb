class Ambient
  attr_reader :object

  def initialize
    @object = Mittsu::HemisphereLight.new(0xd3c0e8, 0xd7ad7e, 0.7)
  end
end