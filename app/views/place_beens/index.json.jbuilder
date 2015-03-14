json.array!(@place_beens) do |place_been|
  json.extract! place_been, :id, :latitude, :longitude, :user_id, :address, :description, :title
  json.url place_been_url(place_been, format: :json)
end
