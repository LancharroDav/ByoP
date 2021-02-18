class Podcast < ApplicationRecord
  has_many :episodes

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

  def get_episodes(url)
    xml = HTTParty.get(url).body
    feed = Feedjira.parse(xml)

    feed.entries.each do |ep|
      title = ep.title
      number = ep.itunes_episode
      description = ep.itunes_summary #ep.description didn't work
      audio_length = ep.itunes_duration
      audio_file_url = '' #ep.link didn't work

      all_params = {title: title,
                    number: number,
                    description: description,
                    audio_length_seconds: audio_length,
                    audio_file_url: audio_file_url
                  }
      
      self.episodes.new(all_params).save
    end
  end
end
