#! /usr/bin/ruby -w

require 'sdl'

def open_window
  SDL.init SDL::INIT_VIDEO
  return SDL::set_video_mode 640, 480, 24, SDL::SWSURFACE
end

def make_color screen,r,g,b
  screen.format.mapRGB r, g, b
end

def refresh screen
  running = true
  while running
    events = []
    while event = SDL::Event2.poll
      case event
        when SDL::Event2::Quit
          running = false
        else
          events.push(event)
      end
    end

    yield(events)
    screen.flip
  end
end


running = true



