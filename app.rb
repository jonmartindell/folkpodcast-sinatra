require "sinatra"
require_relative "lib/gdrive"
require_relative "lib/rss_generator"

get "/" do
  "Welcome to folkpodcaster"
end

get "/podcast.xml" do
  rss_generator = RssGenerator.new
  if rss_generator.days_since_update > 1
    # try to update the list of songs
    existing_files = rss_generator.items.map(&:title)
    gdrive = GDrive.new
    gdrive.list_files.sort.each do |show_filename|
      title = show_filename.sub(".mp3", "")
      if !existing_files.include?(title)
        file = gdrive.read_file(show_filename)
        date = Date.parse(title).to_time
        show_url = "https://folkpodcast.up.railway.app/show/#{show_filename}"
        rss_generator.add_show(title: title, url: show_url, date: date, length_bytes: file.size)
      end
    end
    rss_generator.save!
  end
  send_file RssGenerator::DEFAULT_FILENAME
end

get "/show/*.*" do |path, ext|
  # [path, ext] # => ["path/to/file", "xml"]
  gdrive = GDrive.new
  file = gdrive.read_file(path.concat(".", ext))
  file.download_to_file("data/output.mp3")
  send_file "data/output.mp3"
end
