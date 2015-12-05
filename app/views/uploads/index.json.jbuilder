json.array!(@uploads) do |upload|
  json.extract! upload, :id, :song, :album, :artist
  json.url upload_url(upload, format: :json)
end
