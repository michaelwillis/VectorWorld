require 'Entity.rb'

class Ship < Entity

  def initialize(location, color)
    super [[0, -10], [10, 10], [0, 5], [-10, 10]], color, location
    @cooldown = 10.0
    @thruster = false
  end

  def maintain(entities, seconds)
    super 

    if (@thruster)
      thrust(@forward * 20, seconds)
    end

    if (@spin_left)
      spin(seconds)
    end

    if (@spin_right)
      spin(-seconds)
    end

    @cooldown -= seconds

    if @cooldown <= 0.0 then
      bullet = Bullet.new(@location.clone(), @velocity + @forward * 20, @color)
      entities.push bullet
      @cooldown += 10.0
    end
  end

  def thruster(on)
    @thruster = on
  end

  def spin_left(on)
    @spin_left = on
  end

  def spin_right(on)
    @spin_right = on
  end
end
