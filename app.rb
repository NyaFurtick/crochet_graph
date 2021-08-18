require 'sinatra'
require './file_reader'
require './image_reader'

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

get '/create-graph' do
  erb :create_graph
end

post '/create-graph' do
  @path = params[:pic_name]

  erb :render_graph
end
