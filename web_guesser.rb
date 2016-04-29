require 'sinatra'
require 'sinatra/reloader'

# get '/' do
#   "Hello, World!"
# end

num = rand(100)

get '/' do
  "THE SECRET NUMBER IS #{num}"
end
