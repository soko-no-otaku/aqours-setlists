class AddPositionToEventSong < ActiveRecord::Migration[5.1]
  def change
    add_column :event_songs, :position, :integer
    Event.all.each do |event|
      event.event_songs.order(:updated_at).each.with_index(1) do |event_song, index|
        event_song.update_column :position, index
      end
    end
  end
end
