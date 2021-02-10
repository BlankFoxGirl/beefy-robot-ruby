require_relative "vector2d"
require_relative "board"

class Robot
  def initialize(name, board = nil)
    @name = name
    @board = board.nil? ? Board.new(5, 5) : board
    @vector2d = Vector2D.new
    @placed = false
  end

  def name
    @name
  end

  def placed
    @placed
  end

  def facing
    @vector2d.direction()
  end

  def face(direction)
    @vector2d.direction(direction)
  end

  def turn_left
    if @placed
      self.face(@vector2d.left)
    end
  end

  def turn_right
    if @placed
      self.face(@vector2d.right)
    end
  end

  def position
    return {
      x: @vector2d.x,
      y: @vector2d.y
    }
  end

  def place(x, y, direction)
    if direction.nil?
      raise "Invalid direction"
    end
    # If the position is out of bounds, set the position as the boundrary rather than failing.
    x = @board.can_move_x(x) ? x : @board.x
    y = @board.can_move_y(y) ? y : @board.y
    @vector2d.place(x, y, direction)
    @placed = true
  end

  def move_forwards
    if @board.can_move_direction(@vector2d.forward_forecast, self.facing) and @placed
      @vector2d.forward
    end
  end

  def move_backwards
    if @board.can_move_direction(@vector2d.backward_forecast, self.facing) and @placed
      @vector2d.backward
    end
  end
end