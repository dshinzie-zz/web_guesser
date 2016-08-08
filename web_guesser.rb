require 'sinatra'
require 'sinatra/reloader'

rand_num = rand(101)
get '/' do
   erb :index, locals: {number: rand_num}
end
