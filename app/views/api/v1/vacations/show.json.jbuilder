
  json.id @vacation.id
  json.vacation_name @vacation.vacation_name
  json.city @vacation.city
  json.state @vacation.state
  json.latitude @vacation.latitude
  json.longitude @vacation.longitude
  json.arrive_by @vacation.arrive_by
  json.transpertation @vacation.transpertation
  json.note @vacation.note
  json.user_id @vacation.user_id
  json.created_at @vacation.created_at
  json.updated_at @vacation.updated_at

  json.vacation_spots @vacation.vacation_spots do |spot|
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
    json.vacation_id spot.vacation_id
    json.created_at spot.created_at
    json.updated_at spot.updated_at
    json.city spot.city
    json.state spot.state
    json.zip spot.zip
    json.street_number spot.street_number
  end