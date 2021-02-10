require_relative "../models/robot"
require_relative "../models/vector2d"

describe Vector2D do
    context "Create a new robot" do
        it "the bot should exist" do
            bot = Robot.new("bob-bot-2.0")
            expect(bot.name).to eq ("bob-bot-2.0")
        end

        it "the bot should be facing north by default" do
            bot = Robot.new("bob-bot-2.0")
            expect(bot.facing).to eq (Vector2D::NORTH)
        end

        it "the bot should be at (0,0) for default position" do
            bot = Robot.new("bob-bot-2.0")
            expect(bot.position[:x]).to eq (0.00)
            expect(bot.position[:y]).to eq (0.00)
        end
    end

    context "A robot can move" do
        it "forwards" do
         bot = Robot.new("bob-bot-2.0")
         bot.place(0, 0, Vector2D::EAST)
         bot.move_forwards
         expect(bot.position[:x]).to eq (1)
         expect(bot.position[:y]).to eq (0)
        end
 
        it "backwards" do
            bot = Robot.new("bob-bot-2.0")
            bot.place(1, 0, Vector2D::EAST)
            bot.move_backwards
            expect(bot.position[:x]).to eq (0)
            expect(bot.position[:y]).to eq (0)
        end
     end

     context "A robot can turn" do
        it "left" do
            bot = Robot.new("bob-bot-2.0")
            bot.place(0, 0, Vector2D::EAST)
            bot.turn_left
            expect(bot.facing).to eq (Vector2D::NORTH)
        end
 
        it "right" do
            bot = Robot.new("bob-bot-2.0")
            bot.place(1, 0, Vector2D::EAST)
            bot.turn_right
            expect(bot.facing).to eq (Vector2D::SOUTH)
        end
     end

     context "A robot cannot" do
        it "move too far north" do
            bot = Robot.new("bob-bot-2.0")
            bot.place(0, 5, Vector2D::NORTH)
            bot.move_forwards
            expect(bot.position[:x]).to eq (0)
            expect(bot.position[:y]).to eq (5)
        end
 
        it "move too far south" do
            bot = Robot.new("bob-bot-2.0")
            bot.place(0, 0, Vector2D::SOUTH)
            bot.move_forwards
            expect(bot.position[:x]).to eq (0)
            expect(bot.position[:y]).to eq (0)
        end

        it "move too far east" do
            bot = Robot.new("bob-bot-2.0")
            bot.place(5, 0, Vector2D::EAST)
            bot.move_forwards
            expect(bot.position[:x]).to eq (5)
            expect(bot.position[:y]).to eq (0)
        end

        it "move too far west" do
            bot = Robot.new("bob-bot-2.0")
            bot.place(0, 0, Vector2D::WEST)
            bot.move_forwards
            expect(bot.position[:x]).to eq (0)
            expect(bot.position[:y]).to eq (0)
        end
     end
end