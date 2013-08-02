json.array!(@songs) do |song|
  json.extract! song, :title, :scripture, :copyright_blurb, :featured_order
  json.url song_url(song, format: :json)
end
