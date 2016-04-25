require 'gosu'


FONT_COLOR = 0xff_ffff00

class SpaceInvader < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Space Invaders"
    @message = Gosu::Font.new(20)
    @player = Player.new
  end


  def update
    @player.right if Gosu::button_down?(Gosu::KbRight)
    @player.left if Gosu::button_down?(Gosu::KbLeft)
    #@player.y -= 2 unless @player.collision?(320, 300)
    #@player.y %= 480
  end

  def draw
    @message.draw("Player X => #{@player.x} - Player Y => #{@player.y}", 10, 30, FONT_COLOR)
    @message.draw("Distance from 0 => #{Gosu::distance(@player.x, @player.y, 320, 0)}", 10, 60, FONT_COLOR)
    @player.draw
  end


end

class Player
  attr_accessor :x, :y
  def initialize
    @x = 320
    @y = 400
    @sprite = Gosu::Image.new("media/icon.png")
  end


  def draw
    @sprite.draw(@x, @y, 1)
  end

  def left
    @x -= 5# until @x == 5
  end

  def right
    @x += 5 #until @x == 630
  end

  def collision?(barrier0, barrier1)
    #calculate distanct between cordinates and barrier coordinates.
    if Gosu::distance(@x, @y, barrier0, barrier1) <= 0
      return true
    end
  end
end


window = SpaceInvader.new
window.show