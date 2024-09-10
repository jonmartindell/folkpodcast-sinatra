require 'sinatra'

get '/' do
  'Welcome to folkpodcaster'
end

get '/podcast.xml' do
  send_file "data/podcast.xml"
end

get '/show/*.*' do |path, ext|
  [path, ext] # => ["path/to/file", "xml"]
end
