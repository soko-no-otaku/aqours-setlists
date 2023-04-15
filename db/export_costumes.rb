#!/usr/bin/env ruby
require 'yaml'
require 'csv'

SORTED_EVENT_IDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 17, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 44, 45, 46, 43, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 74, 73, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88]
original = YAML.load_file('events.yml').each.with_index(1).to_a
sorted = original.sort_by do |_, event_id|
  SORTED_EVENT_IDS.index(event_id)
end

CSV.open('costumes.csv', 'wb') do |csv|
  sorted.each do |event, event_id|
    event[:setlists].each do |setlist|
      setlist[:setlist].each do |setlist_song|
        title = setlist_song[:title]
        row = [event_id, title, *setlist_song[:costumes]]
        csv << row
      end
    end
  end
end
