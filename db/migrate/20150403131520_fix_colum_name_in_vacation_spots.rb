class FixColumNameInVacationSpots < ActiveRecord::Migration
  def change
    rename_column :vacation_spots, :lat, :lng
    rename_column :vacation_spots, :address, :route
    rename_column :vacation_spots, :hours, :open
  end
end
