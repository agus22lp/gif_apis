class CreateGifs < ActiveRecord::Migration[5.2]
  def change
    create_table :gifs do |t|
      t.string :api_id
      t.string :url
      t.string :mp4

      t.timestamps
    end
  end
end
