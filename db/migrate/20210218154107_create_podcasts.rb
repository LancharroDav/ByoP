class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.text :description
      t.datetime :publication_date
      t.string :image_url
      t.string :website_url
      t.string :feed_url

      t.timestamps
    end
  end
end
