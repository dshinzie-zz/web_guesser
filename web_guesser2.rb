require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

def check_guess(guess)
  return "Way too high!" if guess > SECRET_NUMBER + 5
  return "Way too low!" if guess < SECRET_NUMBER - 5
  return "Too high!" if guess > SECRET_NUMBER
  return "Too low!" if guess < SECRET_NUMBER
  return "You got it right!" if guess == SECRET_NUMBER
end

def correct_guess(guess)
  return "The SECRET NUMBER is #{SECRET_NUMBER}" if guess == SECRET_NUMBER
end

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  correct = correct_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :correct => correct}
end
