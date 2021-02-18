class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :number
      t.text :description
      t.integer :audio_length_seconds
      t.string :audio_file_url
      t.references :podcast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
