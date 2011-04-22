require 'Entity.rb'

class Bullet < Entity
  def initialize(location, velocity, color)
    super [[0, 1], [-0.866, -0.5], [0.866, -0.5]], color, location
    @velocity = velocity
    @countdown = 15.0
    @angle_velocity = 3.14
    @drag = 0.0
  end

  def maintain(entities, seconds)
    super 
    @countdown -= seconds
  end

  def dead?
    return @countdown <= 0.0
  end
end
