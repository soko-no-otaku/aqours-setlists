class Event < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i(title started_at)

  has_many :event_songs, -> { order(position: :asc) }, inverse_of: :event
  has_many :songs, through: :event_songs
  accepts_nested_attributes_for :event_songs, allow_destroy: true

  def songs_count
    event_songs.size
  end

  def previous
    Event.order(started_at: :desc, id: :desc).where('started_at <= ? and id < ?', started_at, id).first
  end

  def next
    Event.order(started_at: :desc, id: :desc).where('started_at >= ? and id > ?', started_at, id).last
  end
end
