require "sinatra"
require_relative "lib/gdrive"
require_relative "lib/rss_generator"

get "/" do
  "Welcome to folkpodcaster"
end

get "/podcast.xml" do
  send_file "data/podcast.xml"
end

get "/show/*.*" do |path, ext|
  # [path, ext] # => ["path/to/file", "xml"]
  gdrive = GDrive.new
  file = gdrive.read_file(path.concat(".", ext))
  file.download_to_file("data/output.mp3")
  send_file "data/output.mp3"
end
