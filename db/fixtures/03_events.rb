EventVenue.all.each(&:destroy)
SetlistSong.all.each(&:destroy)
Setlist.all.each(&:destroy)

YAML.load_file('db/events.yml').each.with_index(1) do |event, i|
  Event.seed do |s|
    s.id = i
    s.title = event[:title]
    s.tag_list = event[:tags]
  end

  event[:setlists].each do |setlist|
    Setlist.seed do |s|
      s.day_n = setlist[:day_n]
      s.started_at = setlist[:started_at]
      s.event = Event.find(i)
    end

    setlist[:setlist].each do |setlist_song|
      SetlistSong.seed do |s|
        s.setlist = Setlist.find_by(day_n: setlist[:day_n], event_id: i)
        s.song = Song.find_by(title: setlist_song[:title])
        s.available_in_video = setlist_song[:available_in_video]
        s.encore = setlist_song[:encore]
        s.size = setlist_song[:size]
        s.costume_list = setlist_song[:costumes]
      end
    end
  end

  EventVenue.seed do |s|
    s.event = Event.find(i)
    s.venue = Venue.find_by(name: event[:venue])
  end
end
