class Event < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i(title started_at)

  has_many :event_songs, -> { order(position: :asc) }, inverse_of: :event
  has_many :songs, through: :event_songs
  accepts_nested_attributes_for :event_songs, allow_destroy: true
end
