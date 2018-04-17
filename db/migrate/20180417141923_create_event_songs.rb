class CreateEventSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :event_songs do |t|
      t.references :event, foreign_key: true
      t.references :song, foreign_key: true
      t.boolean :tv_size, default: false

      t.timestamps
    end
  end
end
