json.vacationSpot @spots do |spot|

  json.id spot.id
  json.lat spot.lat
  json.lng spot.lng
  json.image spot.image
  json.spot_name spot.spot_name
  json.description spot.description
  json.route spot.route
  json.phone spot.phone
  json.open spot.open
  json.reservation spot.reservation
  json.website spot.website
  json.note spot.note
  json.created_at spot.created_at
  json.updated_at spot.updated_at
  json.city spot.city
  json.state spot.state
  json.zip spot.zip
  json.street_number spot street_number

end