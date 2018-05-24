class CreateSetlistSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :setlist_songs do |t|
      t.references :setlist, foreign_key: true
      t.references :song, foreign_key: true
      t.integer :position
      t.boolean :encore
      t.string :size
      t.boolean :available_in_video

      t.timestamps
    end
  end
end
