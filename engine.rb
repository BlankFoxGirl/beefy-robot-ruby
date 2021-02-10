require_relative "./models/robot"
require_relative "./models/board"

class Engine
  def start(file = nil)
    # Start the engine.
    default_board = Board.new(5, 5)
    beefy = Robot.new("Beefy", default_board)
    commands = self.load_commands_from_file(file)
    self.execute_commands(beefy, commands)
  end

  def load_commands_from_file(filename)
    if filename.nil? # Not specified, go with a default override.
      filename = "commands.txt"
    end

    # Load the contents of a file as a string.
    result = File.read(filename)
    return self.retrieve_commands(result)
  end

  def retrieve_commands(input)
    # Extrapolate commands as an array from supplied input (string)
    # Support for multiple character endings.
    if input.include?("\r\n")
      output = input.split("\r\n")
    else
      output = input.split("\n")
    end

    return output
  end

  def execute_commands(robot, commands)
    for command in commands
      # Split by space.
      cmd_args = command.split(" ")
      case cmd_args[0]
      when "REPORT"
        self.do_report(robot)
      when "LEFT"
        robot.turn_left
      when "RIGHT"
        robot.turn_right
      when "MOVE"
        robot.move_forwards
      when "BACK"
        robot.move_backwards
      when "PLACE"
        placement_vector = cmd_args[1].split(",")
        robot.place(placement_vector[0].to_i, placement_vector[1].to_i, Vector2D.direction_vector(placement_vector[2]))
      end
    end
  end

  def do_report(robot)
    if robot.placed == false
      puts "Robot #{robot.name} was never placed..."
    else
      puts "#{robot.position[:x]},#{robot.position[:y]},#{Vector2D.direction_name(robot.facing)}"
    end
  end
end