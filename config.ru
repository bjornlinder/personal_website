# run lambda { |env| [200, {'Content-Type'=>'text/plain'}, StringIO.new("Hello World!\n")] }
# [Ctrl-D]

require './server'
run Sinatra::Application
