#!/usr/bin/env ruby
require 'yaml'
require 'csv'

CSV.open('costumes.csv', 'wb') do |csv|
  YAML.load_file('events.yml').each do |event|
    event[:setlists].each do |setlist|
      setlist[:setlist].each do |setlist_song|
        title = setlist_song[:title]
        row = [title, *setlist_song[:costumes]]
        csv << row
      end
    end
  end
end
