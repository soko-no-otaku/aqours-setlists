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

  def tweet_text
    if last_performed_event
      "「#{title}」はこれまでに#{performed_count}回披露されていて、最後に披露されたイベントは「#{last_performed_event.title}」です。"
    else
      "「#{title}」はこれまでにライブで披露されたことがありません。"
    end
  end

  def cooccurrence_count(target_song)
    count = 0
    events.each do |event|
      event.songs.each do |song|
        count += 1 if song == target_song
      end
    end
    count
  end

  def group
    if first_performed_event
      first_performed_event.project_level
    else
      100 # Some large number
    end
  end
end
