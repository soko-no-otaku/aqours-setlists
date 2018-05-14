# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'yaml'

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

CSV.foreach('db/events.csv', headers: true) do |row|
  Event.create(
    title: row['title'],
    started_at: row['started_at']
  )
end

CSV.foreach('db/venues.csv', headers: true) do |row|
  Venue.create(
    name: row['name'],
    address: row['address'],
    url: row['url'],
    capacity: row['capacity']
  )
end

YAML.load_file('db/event_songs.yml').each do |e|
  event = Event.find_by(title: e['title'])
  venue = Venue.find_by(name: e['venue'])
  EventVenue.create(
    event: event,
    venue: venue
  )

  event.tag_list = e['tags']
  event.save

  e['setlist'].each do |s|
    song = Song.find_by(title: s)
    EventSong.create(
      event: event,
      song: song
    )
  end
end
