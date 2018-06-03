class Base
  extend Forwardable

  def_delegators :@object, :position, :rotation, :scale, :children
  attr_reader :object

  def initialize
    @object = load
  end

  def name
    self.class.name.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
                    gsub(/([a-z\d])([A-Z])/,'\1_\2').
                    downcase
  end
end
