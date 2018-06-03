module ComposersGraphHelper
  def append_artist_node(artist)
    unless @artist_nodes.has_key?(artist)
      artist_node = {
          class: 'artist',
          text: artist,
          count: 0
      }
      @artist_nodes[artist] = artist_node
    end
    @artist_nodes[artist][:count] += 1

    @links << {
        source: @song_index,
        target: @artist_nodes.keys.index(artist) + @artist_offset
    }
  end
end
