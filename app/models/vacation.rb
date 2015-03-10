class Vacation < ActiveRecord::Base
  enum arrive_by:       {:air => 0, :car => 1, :train => 2}
  enum transpertation:  {:'car rental' => 3, "bus or train" => 4, :walking => 5}
  belongs_to :user
  has_many :accommodations

  def time_date
    time_date = Time.now 
    @current_time_date = time_date.strftime("%b %e, %l:%M %p")
  end
end
