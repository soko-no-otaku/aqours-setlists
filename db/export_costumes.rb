#!/usr/bin/env ruby
require 'yaml'
require 'csv'

CSV.open('costumes.csv', 'wb') do |csv|
  YAML.load_file('events.yml').each.with_index(1) do |event, event_id|
    event[:setlists].each do |setlist|
      setlist[:setlist].each do |setlist_song|
        title = setlist_song[:title]
        row = [event_id, title, *setlist_song[:costumes]]
        csv << row
      end
    end
  end
end
