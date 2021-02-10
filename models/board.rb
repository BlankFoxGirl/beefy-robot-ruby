require_relative "vector2d"
class Board
  def initialize(x, y)
    @x = x
    @y = y
  end

  def x
    @x
  end

  def y
    @y
  end

  def can_move(x, y)
    return (self.can_move_x(x) and self.can_move_y(y)) ? true : false
  end

  def can_move_direction(magnitude, direction)
    if direction == Vector2D::NORTH or direction == Vector2D::SOUTH
      return can_move_y(magnitude)
    else
      return can_move_x(magnitude)
    end
  end

  def can_move_x(x)
    return true if x.to_i >= 0 and x.to_i <= @x
  end

  def can_move_y(y)
    return true if y >= 0 and y <= @y
  end
end