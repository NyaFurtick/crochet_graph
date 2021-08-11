require 'sinatra'
require './file_reader'

get '/' do
  'Welcome to graphgan!'
end

get '/graph' do
  @graph = FileReader.new("canvas.txt").graphgan

  erb :graph
end
