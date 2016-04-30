require 'sinatra'
require 'sinatra/reloader'

@@counter = 5
@@secret_number = rand(100)

  get '/' do
    guess = params['guess'].to_i
    # checker = count_checker(guess)
    message = guess_message(guess)
    color = background_color(guess)
    erb :index, :locals => {:number => @@secret_number, :message => message, :color => color}
  end

  def reset
    @@secret_number = rand(100)
    @@counter = 5
  end


def guess_message(guess)
  return "Please enter a number" if guess.nil?
  @@counter -= 1
  if @@counter == 0
    reset
    "You lose! A new number has been generated. Enter a guess"
  elsif guess > @@secret_number + 5
    "Way too high! You have #{@@counter} guesses remaining"
  elsif guess > @@secret_number
    "Too high! You have #{@@counter} guesses remaining"
  elsif guess < @@secret_number - 5
    "Way too low! You have #{@@counter} guesses remaining"
  elsif guess < @@secret_number
    "Too low! You have #{@@counter} guesses remaining"
  else
    reset
    "You got it right!"
    "The SECRET NUMBER is #{@@secret_number}. A new number has been generated."
  end
end

  def background_color(guess)
    if guess > @@secret_number + 5
      'red'
    elsif guess > @@secret_number
      'orange'
    elsif guess < @@secret_number- 5
      'red'
    elsif guess < @@secret_number
      'orange'
    elsif guess == @@secret_number
      'green'
    end
  end
