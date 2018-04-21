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

  def last_performed_time_ago_in_words
    unless last_performed_event.nil?
      "#{time_ago_in_words(last_performed_event.started_at)} @ #{last_performed_event.title}"
    else
      '未披露'
    end
  end
end
