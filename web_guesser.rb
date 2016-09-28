require 'sinatra/reloader'
require 'sinatra'


SECRET_NUMBER = rand(101)

def check_guess(guess)
  return ["Way too high!", "way_high"] if guess > SECRET_NUMBER + 5
  return ["Way too low!", "way_low"] if guess < SECRET_NUMBER - 5
  return ["Too high!", "high"] if guess > SECRET_NUMBER
  return ["Too low!", "low"] if guess < SECRET_NUMBER
  return ["You got it right!", "correct"] if guess == SECRET_NUMBER
end

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, locals: {number: SECRET_NUMBER, message: message[0], message_style: message[1]}
end
