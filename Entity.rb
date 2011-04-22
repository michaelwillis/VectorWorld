require "matrix"

class Entity

  def initialize(points, color, location)
    @points = Matrix.rows(points)
    @color = color
    @location = Vector.elements(location)
    @mass = 1 #kg
    @velocity = Vector[0.0, 0.0]
    @drag = 0.2
    @angle = 0
    @spin = 3.1415 / 4
  end

  def thrust(vector, seconds)
    @velocity = @velocity + Vector.elements(vector) * seconds
  end

  def spin(seconds)
    @angle += @spin * seconds
  end

  def maintain(entities, seconds)
    @location += @velocity * seconds
    @velocity -= @velocity * @drag * seconds

    @cosine = Math.cos @angle
    @sine = Math.sin @angle

    @forward = Vector[-@sine,-@cosine]
  end

  def draw(screen, scale)

    rotated = @points * Matrix[[@cosine,-@sine],[@sine,@cosine]]
    
    (0..rotated.row_size() - 1).each do |i|
      v1 = rotated.row(i - 1) + @location
      v2 = rotated.row(i) + @location
      screen.draw_aa_line(v1[0], v1[1], v2[0], v2[1], @color)
    end
  end

  def dead?
    return false
  end

end
