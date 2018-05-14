# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

YAML.load_file('db/songs.yml').each do |s|
  song = Song.create(
      title: s[:title],
      released_at: s[:released_at]
  )

  song.lyricist_list = s[:lyricists]
  song.composer_list = s[:composers]
  song.arranger_list = s[:arrangers]
  song.save
end

Venue.create(YAML.load_file('db/venues.yml'))

YAML.load_file('db/events.yml').each do |e|
  event = Event.create(
      title: e[:title],
      started_at: e[:started_at]
  )

  e[:setlist].each do |s|
    song = Song.find_by(title: s)
    EventSong.create(
        event: event,
        song: song
    )
  end

  venue = Venue.find_by(name: e[:venue])
  EventVenue.create(
      event: event,
      venue: venue
  )

  event.tag_list = e[:tags]
  event.save
end
