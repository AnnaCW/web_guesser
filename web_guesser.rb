require 'sinatra'
require 'sinatra/reloader'

@@counter = 5
@@secret_number = rand(1..100)

  get '/' do
    guess = params['guess'].to_i
    cheat = params['cheat']
    checker = cheat_checker(cheat)
    message = guess_message(guess) if !checker
    color = background_color(guess)
    erb :index, :locals => {:number => @@secret_number, :checker => checker, :message => message, :color => color}
  end

  def reset
    @@secret_number = rand(1..100)
    @@counter = 5
  end

def cheat_checker(cheat)
  if cheat == "true"
    "Cheat mode. The secret number is #{@@secret_number}"
  end
end

def guess_message(guess)
  return "Please enter a number 1-100" if guess == 0
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
    winning_number = @@secret_number
    reset
    "You got it right! The SECRET NUMBER is #{winning_number}. A new number has been generated."
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
