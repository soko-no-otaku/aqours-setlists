class Event < ApplicationRecord
  has_many :event_songs, -> { order(position: :asc) }
  has_many :songs, through: :event_songs
  accepts_nested_attributes_for :event_songs
end
