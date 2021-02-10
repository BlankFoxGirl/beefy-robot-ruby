class Vector2D
    # Constants
    const_set("NORTH", 1)
    const_set("EAST", 2)
    const_set("SOUTH", 3)
    const_set("WEST", 4)

    def initialize
        # Set Defaults
        @x = 0.00
        @y = 0.00
        @direction = NORTH
    end

    # Model Methods

    def y
        @y
    end

    def x
        @x
    end

    def direction(direction = nil)
        if !direction.nil?
            @direction = direction
        end
        @direction
    end

    # Helpers
    def self.direction_name(direction)
        # Returns with a human readable version of the direction.
        case direction
        when NORTH
            return "NORTH"
        when EAST
            return "EAST"
        when SOUTH
            return "SOUTH"
        when WEST
            return "WEST"
        end
    end

    def self.direction_vector(direction)
        # Returns with the Vector2D constant for the given direction string.
        case direction
        when "NORTH"
            return NORTH
        when "EAST"
            return EAST
        when "SOUTH"
            return SOUTH
        when "WEST"
            return WEST
        end
    end

    def place(x, y, direction)
        # Spawns on location.
        @x = x
        @y = y
        @direction = direction
    end

    def forward(amount = 1)
        # Moves a Vector2D Forwards.
        if @direction == NORTH or @direction == SOUTH
            @y = self.forward_forecast(amount)
        else
            @x = self.forward_forecast(amount)
        end
    end

    def backward(amount = 1)
        # Moves a Vector2D Backwards.
        if @direction == NORTH or @direction == SOUTH
            @y = self.backward_forecast(amount)
        else
            @x = self.backward_forecast(amount)
        end
    end

    def right
        what_is_right = @direction
        if @direction == 4
            what_is_right = 1
        else
            what_is_right += 1
        end
    end

    def left
        what_is_left = @direction
        if @direction == 1
            what_is_left = 4
        else
            what_is_left -= 1
        end
    end

    # Helper methods
    def forward_forecast(amount = 1)
        # Calculates a forwards movement.
        case @direction
        when NORTH
            return @y + amount
        when SOUTH
            return @y - amount
        when EAST
            return @x + amount
        when WEST
            return @x - amount
        end
    end

    def backward_forecast(amount = 1)
        # Calculates a backwards movement.
        case @direction
        when NORTH
            return @y - amount
        when SOUTH
            return @y + amount
        when EAST
            return @x - amount
        when WEST
            return @x + amount
        end
    end
end