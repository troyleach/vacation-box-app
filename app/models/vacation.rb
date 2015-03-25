class Vacation < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  enum arrive_by:       {:air => 0, :car => 1, :train => 2}
  enum transpertation:  {:'car rental' => 3, "bus or train" => 4, :walking => 5}
  
  belongs_to :user
  has_many :accommodations
  has_many :vacation_spots

  def time_date
    time_date = Time.now 
    @current_time_date = time_date.strftime("%b %e, %l:%M %p")
  end

  def today
    Time.now.strftime("%b %d, %Y")
  end

  def convert_date(date)
    Date.parse(date).strftime("%b %d, %Y")
  end
 

  def line
    puts "*" * 100
  end

end
