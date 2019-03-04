class Song < ApplicationRecord
  include ActionView::Helpers::DateHelper

  has_many :setlist_songs
  has_many :setlists, -> { order(started_at: :asc) }, through: :setlist_songs

  acts_as_ordered_taggable_on :lyricists, :composers, :arrangers
  is_impressionable

  def performed_count
    setlist_songs.size
  end

  def last_performed_event
    setlists.last&.event
  end

  def first_performed_event
    setlists.first&.event
  end

  def last_performed_event_full_title
    [setlists.last.event.title, setlists.last.day_n].join(' ')
  end

  def first_performed_event_full_title
    [setlists.first.event.title, setlists.first.day_n].join(' ')
  end

  def tweet_text
    if setlists.present?
      "「#{title}」はこれまでに#{performed_count}回披露されていて、最後に披露されたイベントは「#{last_performed_event_full_title}」です。"
    else
      "「#{title}」はこれまでにライブで披露されたことがありません。"
    end
  end

  def performed_rate
    setlists.uniq.size.to_f / Setlist.count * 100
  end

  def cooccurrence_count(target_song)
    count = 0
    setlists.each do |setlist|
      setlist.songs.each do |song|
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
