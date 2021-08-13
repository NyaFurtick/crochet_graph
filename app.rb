require 'sinatra'
require './file_reader'

get '/' do
  erb :index
end

get '/graph' do
  erb :graph_index
end

get '/graph/:file_name' do
  file_name = params['file_name'].concat '.txt'
  @graph = FileReader.new(file_name).graphgan

  erb :graph

rescue Errno::ENOENT
  'file does not exist'
end
