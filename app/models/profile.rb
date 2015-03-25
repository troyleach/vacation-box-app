class Profile < ActiveRecord::Base
  belongs_to :user
  geocoded_by :locality
  after_validation :geocode
end
