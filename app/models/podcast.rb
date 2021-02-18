class Podcast < ApplicationRecord

  def self.get_feed(url)
    xml = HTTParty.get(url).body
    feed = Feedjira.parse(xml)

    title = feed.title
    description = feed.description
    pub_date = '' #feed.pubDate didn't work
    image_url = feed.image.url
    website_url = feed.image.link #feed.link didn't work
    feed_url = url

    all_params = {title: title, 
                  description: description, 
                  publication_date: pub_date, 
                  image_url: image_url, 
                  website_url: website_url,
                  feed_url: feed_url
                }

    Podcast.new(all_params).save
  end
end
