# coding: utf-8

require 'chingu'
require 'gosu'

module Chingu
  ROOT_DIR = Yella::ROOT_DIR
end

module Yella
    SCREEN_WIDTH  = 250
    SCREEN_HEIGTH = 250

    class Game < Chingu::Window
      def initialize
        super(Yella::SCREEN_WIDTH, Yella::SCREEN_HEIGTH)

        Image.autoload_dirs << File.join(ROOT_DIR, 'media')

        self.input = { :esc => :exit }

        @thing = Thing.create
        @thing.input = { :left => :move_left,
                         :right => :move_right,
                         :up => :move_up,
                         :down => :move_down }
    end

  class Thing < Chingu::GameObject
    def initialize
      super options.merge(:image => Image['beaver.jpg'])
    end

    def move_left
      @x -= 1
    end

    def move_right
      @x += 1
    end

    def move_up
      @y += 1
    end

    def move_down
      @y -= 1
    end
  end

  def self.play
    Game.new.show
  end
end
