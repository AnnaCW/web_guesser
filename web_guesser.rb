require 'sinatra'
require 'sinatra/reloader'

# get '/' do
#   "Hello, World!"
# end

number = rand(100)

get '/' do
  erb :index, :locals => {:number => number}
end
