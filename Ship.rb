require 'Entity.rb'

class Ship < Entity

  def initialize(location, color)
    super [[0, -10], [10, 10], [0, 5], [-10, 10]], color, location
    @cooldown = 10.0
  end

  def maintain(entities, seconds)
    super 

    @cooldown -= seconds

    if @cooldown <= 0.0 then
      bullet = Bullet.new(@location.clone(), @color)
      bullet.thrust([@cosine, @sine], 40.0)
      entities.push bullet
      @cooldown += 10.0
    end
  end
end
