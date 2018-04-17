class EventSong < ApplicationRecord
  belongs_to :event
  belongs_to :song
end
