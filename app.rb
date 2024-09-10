require 'sinatra'

get '/' do
  'Choo Choo! Welcome to your Sinatra server 🚅'
end

get '/podcast.rss' do
  <<-XML
    <?xml version="1.0" encoding="UTF-8"?>
    <rss version="2.0"
      xmlns:content="http://purl.org/rss/1.0/modules/content/"
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd"
      xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
      <channel>
        <title>Folk with Matt Watroba</title>
        <link>https://www.wkar.org</link>
        <description>WKAR&#39;s Weekly Folk with Matt Watroba</description>
        <language>en-us</language>
        <copyright>NA</copyright>
        <lastBuildDate>Mon, 09 Sep 2024 19:28:22 +0000</lastBuildDate>
        <item>
          <title>Folk with Matt Watroba 2024-09-08</title>
          <link>https://www.wkar.org</link>
          <description>Folk with Matt Watroba 2024-09-08</description>
          <enclosure url="https://drive.google.com/uc?id=1h_292rHlKC_9UyQKkeeCbKN87rQKSXT4&amp;export=download&amp;acknowledgeAbuse=true"
            length="176479432"
            type="audio/mpeg"/>
          <pubDate>Sun, 08 Sep 2024 04:00:00 -0000</pubDate>
          <guid isPermaLink="false">89d92c50-41a7-470f-82a0-d98ea9d86c90</guid>
        </item>
      </channel>
    </rss>
  XML
end

get '/show/*.*' do |path, ext|
  [path, ext] # => ["path/to/file", "xml"]
end
