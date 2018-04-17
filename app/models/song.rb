class Song < ApplicationRecord
  has_many :event_songs
  has_many :events, through: :event_songs
end
