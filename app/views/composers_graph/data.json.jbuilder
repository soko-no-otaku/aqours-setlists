@song_index = 0
@artist_nodes = {}
@artist_offset = @uranohoshi_songs.size + @otonokizaka_songs.size + @nijigasaki_songs.size
@links = []

json.nodes do
  json.array! @uranohoshi_songs do |song|
    json.text song.title
    json.class 'uranohoshi'
    (song.composer_list + song.arranger_list).each do |artist|
      append_artist_node(artist)
    end
    @song_index += 1
  end

  json.array! @otonokizaka_songs do |song|
    json.text song[:title]
    json.class 'otonokizaka'
    (song[:composer_list] + song[:arranger_list]).each do |artist|
      append_artist_node(artist)
    end
    @song_index += 1
  end

  json.array! @nijigasaki_songs do |song|
    json.text song[:title]
    json.class 'nijigasaki'
    (song[:composer_list] + song[:arranger_list]).each do |artist|
      append_artist_node(artist)
    end
    @song_index += 1
  end

  json.array! @artist_nodes.values
end

json.links @links
