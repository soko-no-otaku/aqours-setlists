# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

YAML.load_file('db/events.yml').each do |e|
  event = Event.create(title: e[:title])

  e[:setlists].each do |sl|
    setlist = Setlist.create(
        day_n: sl[:day_n],
        started_at: sl[:started_at],
        event: event
    )

    sl[:setlist].each do |s|
      song = Song.find_by(title: s[:title])
      setlist_song = SetlistSong.create(
          setlist: setlist,
          song: song,
          available_in_video: s[:available_in_video],
          encore: s[:encore],
          size: s[:size]
      )

      setlist_song.costume_list = s[:costumes]
      setlist_song.save
    end
  end

  venue = Venue.find_by(name: e[:venue])
  EventVenue.create(
      event: event,
      venue: venue
  )

  event.tag_list = e[:tags]
  event.save
end
