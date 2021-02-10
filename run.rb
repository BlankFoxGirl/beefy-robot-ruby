# This is the entrypoint to execute the ruby app.

require_relative "./engine"

engine = Engine.new
engine.start(ARGV.length != 0 ? ARGV[0] : nil)