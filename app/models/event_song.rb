class EventSong < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i(id event_id song_id position _destroy)

  belongs_to :event
  belongs_to :song
  acts_as_list scope: :event

  def selectable_songs
    Song.all
  end
end
