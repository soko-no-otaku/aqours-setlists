class CooccurrenceGraphController < ApplicationController
  def index
  end

  def data
    nodes = []
    links = []

    Song.all.includes(:setlists).each do |source_song|
      nodes << {
          title: source_song.title,
          group: source_song.group,
          count: source_song.performed_count
      }

      Song.all.each do |target_song|
        links << {
            source: source_song.id - 1,
            target: target_song.id - 1,
            value: source_song.cooccurrence_count(target_song)
        }
      end
    end

    render :json => {'nodes': nodes, 'links': links}
  end
end
