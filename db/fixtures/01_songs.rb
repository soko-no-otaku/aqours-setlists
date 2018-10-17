YAML.load_file('db/songs.yml').each.with_index(1) do |song, i|
  Song.seed do |s|
    s.id = i
    s.title = song[:title]
    s.released_at = song[:released_at]

    s.lyricist_list = song[:lyricists]
    s.composer_list = song[:composers]
    s.arranger_list = song[:arrangers]
  end
end
