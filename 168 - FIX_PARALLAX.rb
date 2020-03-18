class Game_Map
  def parallax_ox(bitmap)
    if @parallax_loop_x
      if @parallax_sx  == 0
        @parallax_x * 32
      else
        @parallax_x * 16
      end
    else
      w1 = [bitmap.width - Graphics.width, 0].max
      w2 = [width * 32 - Graphics.width, 1].max
      @parallax_x * 16 * w1 / w2
    end
  end
  def parallax_oy(bitmap)
    if @parallax_loop_y
      if @parallax_sy  == 0
        @parallax_y * 32
      else
        @parallax_y * 16
      end    else
      h1 = [bitmap.height - Graphics.height, 0].max
      h2 = [height * 32 - Graphics.height, 1].max
      @parallax_y * 16 * h1 / h2
    end
  end
end
class Sprite_Picture < Sprite
  def update_position
    self.x = @picture.x
    self.y = @picture.y
    self.z = @picture.number
    fixed = @picture.name.include?("[FIXED]") ? true : false
    if fixed
      self.x += ( self.ox - ($game_map.display_x * 32 ))
      self.y += ( self.ox - ($game_map.display_y * 32 ))
    end
  end
end