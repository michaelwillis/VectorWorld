require 'framework.rb'
require 'Entity.rb'
require 'Ship.rb'
require 'Bullet.rb'

screen = open_window

BLACK  = make_color screen, 0,   0,   0
RED    = make_color screen, 255, 0,   0
GREEN  = make_color screen, 0,   255, 0
BLUE   = make_color screen, 0,   0,   255
BROWN  = make_color screen, 130, 100, 20
WHITE  = make_color screen, 255, 255, 255
PINK   = make_color screen, 255, 128, 128
PURPLE = make_color screen, 192, 16,  96
GRAY   = make_color screen, 192, 192, 192

entities =  [
 Ship.new([100.0, 100.0], GRAY),
 Ship.new([200.0, 50.0], PURPLE),
 Ship.new([175.0, 120.0], WHITE),
 Bullet.new([500.0, 300.0], PINK)
]

entities[0].thrust([1.0, 1.0], 10.0)
entities[0].spin(1.0, 1.0)

entities[1].thrust([2.0, 1.0], 10.0)
entities[1].spin(-1.0, 1.0)

entities[2].thrust([1.0, 2.0], 10.0)
entities[2].spin(0.5, 1.0)

entities[3].thrust([-3.0, -3.0], 20.0)
entities[3].spin(1.0, 1.0)


refresh(screen) {
  screen.fill_rect 0, 0, 640, 480, BLACK

  entities.each do |entity|
    entity.maintain(entities, 0.05)
    entity.draw(screen, 2.0)
  end
  
  entities = entities.reject do |entity| entity.dead? end

}

  
