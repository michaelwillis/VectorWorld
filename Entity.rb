class Entity

  def initialize(points, color, location)
    @points = points
    @color = color
    @location = location
    @mass = 1 #kg
    @velocity = [0.0, 0.0]
    @drag = 0.2
    @angle = 0
    @angle_velocity = 0.0
    @angle_drag = 0.1
  end

  def thrust(vector, seconds)
    @velocity[0] += vector[0] * seconds
    @velocity[1] += vector[1] * seconds
  end

  def spin(torque, seconds)
    # torque is probably a misnomer
    @angle_velocity += torque * seconds
  end

  def maintain(entities, seconds)
    @location[0] += @velocity[0] * seconds
    @location[1] += @velocity[1] * seconds
    
    @velocity[0] -= (@drag * @velocity[0] * seconds)
    @velocity[1] -= (@drag * @velocity[1] * seconds)

    @angle += @angle_velocity * seconds
    @angle_velocity -= @angle_drag * @angle_velocity * seconds
  end

  def draw(screen, scale)

    @cosine = Math.cos @angle
    @sine = Math.sin @angle

    rotated = []

    @points.each do |point|
      rotated.push [point[0] * @cosine - point[1] * @sine,
                    point[0] * @sine + point[1] * @cosine]
    end

    rotated.each_index do |index|
      screen.draw_line(
        rotated[index - 1][0] + @location[0],
        rotated[index - 1][1] + @location[1],
        rotated[index][0] + @location[0],
        rotated[index][1] + @location[1],
        @color)
    end
  end

  def dead?
    return false
  end

end
