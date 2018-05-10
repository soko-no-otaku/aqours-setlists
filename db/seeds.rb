# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'yaml'

CSV.foreach('db/songs.csv', headers: true) do |row|
  Song.create(
    title: row['title'],
    released_at: row['released_at']
  )
end

CSV.foreach('db/events.csv', headers: true) do |row|
  Event.create(
    title: row['title'],
    started_at: row['started_at']
  )
end

YAML.load_file('db/event_songs.yml').each do |e|
  event = Event.find_by(title: e['title'])
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
