require 'sinatra'
require './file_reader'

get '/' do
  'Welcome to graphgan!'
end

get '/graph' do
  @file = FileReader.new("canvas.txt")

  erb :graph
end
