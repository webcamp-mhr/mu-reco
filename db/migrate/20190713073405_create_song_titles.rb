class CreateSongTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :song_titles do |t|
      t.integer :disc_id
      t.string :song_title
      t.integer :truck_number

      t.timestamps
    end
  end
end
