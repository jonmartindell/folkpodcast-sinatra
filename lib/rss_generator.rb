require "rss"
require "date"
require "forwardable"

class RssGenerator
  extend Forwardable
  DEFAULT_FILENAME = "data/podcast.xml"
  def_delegators :@rss, :channel, :items

  def initialize(file: DEFAULT_FILENAME)
    @rss = RSS::Parser.parse(File.read(file))
    @mtime = File.new(file).mtime
  end

  def days_since_update
    (Date.parse(Time.now.to_s) - Date.parse(@mtime.to_s)).to_i
  end

  def add_show(title:, url:, date:, length_bytes:)
    new_item = items.first.dup
    new_item.title = title
    new_item.description = title
    new_item.pubDate = date.utc
    new_item.enclosure.url = url
    new_item.enclosure.length = length_bytes
    items << new_item
  end

  def save!(out_file: DEFAULT_FILENAME)
    File.write(out_file, @rss)
  end
end
