class Event < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i(title tag_list)

  has_many :setlists, -> { order(started_at: :asc) }, inverse_of: :event
  accepts_nested_attributes_for :setlists, allow_destroy: true

  has_one :event_venue, inverse_of: :event
  has_one :venue, through: :event_venue
  accepts_nested_attributes_for :event_venue, allow_destroy: true

  acts_as_taggable

  def setlists_count
    setlists.size
  end

  def previous
    Event.order(id: :desc).where('id < ?', id).first
  end

  def next
    Event.order(id: :desc).where('id > ?', id).last
  end

  def period
    [setlists.first.started_at.to_date, setlists.last.started_at.to_date]
  end

  def transposed_setlist_songs
    setlists.map do |setlist|
      setlist.setlist_songs.to_a
    end.transpose
  end

  def tweet_text
    "「#{title}」のセットリスト"
  end

  def project_level
    milestones.take_while do |event_title|
      id >= Event.find_by(title: event_title).id
    end.size
  end

  private

    def milestones
      [
        'ラブライブ！サンシャイン!! Aqoursスペシャル課外活動 みんな準備はできてるかい？ ～せーので SUNSHINE!!～',
        'ラブライブ！サンシャイン!! Aqours夏休み課外活動 ～みんなでいっしょに夏まつり～ in 沼津',
        'ラブライブ！サンシャイン!! Aqours冬休み課外活動 ～みんなでシャンシャン♪ Aqoursミニライブ2016♪～',
        'ラブライブ！サンシャイン!! Aqours First LoveLive! ～Step! ZERO to ONE!!～',
        'ラブライブ！サンシャイン!! Aqours 2nd LoveLive! HAPPY PARTY TRAIN TOUR 名古屋公演',
        'めざましテレビ PRESENTS T-SPOOK 〜TOKYO HALLOWEEN PARTY〜',
        'DENGEKI 25th Anniversary DENGEKI MUSIC LIVE!! 2018',
        'Saint Snow PRESENTS LOVELIVE! SUNSHINE!! HAKODATE UNIT CARNIVAL'
      ]
    end
end
