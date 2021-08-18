require 'sinatra'
require './file_reader'
require './image_handler'
require './file_name_generator'

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
  org_path = params[:pic_name]
  @new_path = FileNameGenerator.new(org_path).processed_file_name
  ImageHandler.new(org_path, @new_path).process

  erb :render_graph
end
