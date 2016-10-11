json.extract! track, :id, :user_id, :name, :filename, :created_at, :updated_at
json.url track_url(track, format: :json)