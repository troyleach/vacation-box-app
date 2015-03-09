class Vacation < ActiveRecord::Base
  enum arrive_by:       {:air => 0, :car => 1, :train => 3}
  enum transpertation:  {:car_rental => 0, :bus_train => 1, :walking => 2}
  belongs_to :user
  has_many :accommodations
end
