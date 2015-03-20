class Profile < ActiveRecord::Base
  belongs_to :user
  geocoded_by :city
  after_validation :geocode

end
# need to set it up so that IF the user puts in address it looks for that lat long