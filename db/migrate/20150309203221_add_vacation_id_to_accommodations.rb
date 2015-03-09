class AddVacationIdToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :vacation_id, :integer
  end
end
