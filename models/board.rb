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

  def can_move_direction(magnitude, direction)
    # Check to see if we can move in a certain direction by the supplied magnitude.
    if direction == Vector2D::NORTH or direction == Vector2D::SOUTH
      return can_move_y(magnitude)
    else
      return can_move_x(magnitude)
    end
  end

  def can_move_x(x)
    # Can move to X.
    return true if x.to_i >= 0 and x.to_i <= @x
  end

  def can_move_y(y)
    # Can move to Y.
    return true if y.to_i >= 0 and y.to_i <= @y
  end
end