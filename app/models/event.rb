class Event < ApplicationRecord
  REGISTRABLE_ATTRIBUTES = %i(title started_at tag_list)

  has_many :event_songs, -> { order(position: :asc) }, inverse_of: :event
  has_many :songs, through: :event_songs
  accepts_nested_attributes_for :event_songs, allow_destroy: true

  has_one :event_venue, inverse_of: :event
  has_one :venue, through: :event_venue
  accepts_nested_attributes_for :event_venue, allow_destroy: true

  acts_as_taggable

  def songs_count
    event_songs.size
  end

  def previous
    Event.order(started_at: :desc, id: :desc).where('started_at <= ? and id < ?', started_at, id).first
  end

  def next
    Event.order(started_at: :desc, id: :desc).where('started_at >= ? and id > ?', started_at, id).last
  end

  def tweet_text
    "「#{title}」のセットリスト"
  end

  def project_level
    milestones.take_while do |event_title|
      started_at >= Event.find_by(title: event_title).started_at
    end.size
  end

  private

    def milestones
      [
        'ラブライブ！サンシャイン!! Aqoursスペシャル課外活動 みんな準備はできてるかい？ ～せーので SUNSHINE!!～',
        'ラブライブ！サンシャイン!! Aqours夏休み課外活動 ～みんなでいっしょに夏まつり～ in 沼津',
        'ラブライブ！サンシャイン!! Aqours冬休み課外活動 ～みんなでシャンシャン♪ Aqoursミニライブ2016♪～ 第1回目公演',
        'ラブライブ！サンシャイン!! Aqours First LoveLive! ～Step! ZERO to ONE!!～ Day.1',
        'ラブライブ！サンシャイン!! Aqours 2nd LoveLive! HAPPY PARTY TRAIN TOUR 名古屋公演 Day.1',
        'めざましテレビ PRESENTS T-SPOOK 〜TOKYO HALLOWEEN PARTY〜',
        'DENGEKI 25th Anniversary DENGEKI MUSIC LIVE!! 2018',
        'Saint Snow PRESENTS LOVELIVE! SUNSHINE!! HAKODATE UNIT CARNIVAL Day.1'
      ]
    end
end
