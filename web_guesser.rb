require 'sinatra'
require 'sinatra/reloader'

# get '/' do
#   "Hello, World!"
# end

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = guess_message(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def guess_message(guess)
  if guess > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess < SECRET_NUMBER - 5
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  else
    "You got it right!"
    "The SECRET NUMBER is #{SECRET_NUMBER}."
  end
end
