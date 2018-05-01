class Song < ApplicationRecord
  include ActionView::Helpers::DateHelper

  has_many :event_songs
  has_many :events, through: :event_songs

  def performed_count
    event_songs.size
  end

  def last_performed_event
    events.order('started_at').last
  end

  def first_performed_event
    events.order('started_at').first
  end
end
