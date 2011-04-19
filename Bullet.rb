require 'Entity.rb'

class Bullet < Entity
  def initialize(location, color)
    super [[0, 2], [2, -2], [-2, -2]], color, location
    @countdown = 15.0
  end

  def maintain(entities, seconds)
    super 
    @countdown -= seconds
  end

  def dead?
    return @countdown <= 0.0
  end
end
