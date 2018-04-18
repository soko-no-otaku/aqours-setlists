class EventSong < ApplicationRecord
  belongs_to :event
  belongs_to :song
  acts_as_list scope: :event
end
