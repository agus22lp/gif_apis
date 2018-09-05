class CreateGiphies < ActiveRecord::Migration[5.2]
  def change
    create_table :giphies do |t|
      t.string :api_id
      t.string :slug
      t.string :url
      t.string :bitly_url
      t.string :embed_url
      t.string :username
      t.string :source
      t.string :source_tld
      t.string :source_post_url
      t.string :title

      t.timestamps
    end
  end
end
