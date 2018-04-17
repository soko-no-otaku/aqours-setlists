json.extract! song, :id, :title, :released_at, :created_at, :updated_at
json.url song_url(song, format: :json)
