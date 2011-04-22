require 'framework.rb'
require 'Entity.rb'
require 'Ship.rb'
require 'Bullet.rb'

screen = open_window

BLACK   = make_color screen, 0, 0, 0
GRAY   = make_color screen, 192, 192, 192

entities =  [
 Ship.new([100.0, 100.0], GRAY),
]

ship = entities[0]

refresh(screen) { |events|

  events.each do |event|
    case event
      when SDL::Event2::KeyDown
        if (event.sym == SDL::Key::UP)
          ship.thruster true
        end
        if (event.sym == SDL::Key::LEFT)
          ship.spin_left true
        end       
        if (event.sym == SDL::Key::RIGHT)
          ship.spin_right true
        end
      when SDL::Event2::KeyUp
        if (event.sym == SDL::Key::UP)
          ship.thruster false
        end
        if (event.sym == SDL::Key::LEFT)
          ship.spin_left false
        end       
        if (event.sym == SDL::Key::RIGHT)
          ship.spin_right false
        end
    end
  end

  screen.fill_rect 0, 0, 640, 480, BLACK

  entities.each do |entity|
    entity.maintain(entities, 0.05)
    entity.draw(screen, 2.0)
  end
  
  entities = entities.reject do |entity| entity.dead? end

}

  
