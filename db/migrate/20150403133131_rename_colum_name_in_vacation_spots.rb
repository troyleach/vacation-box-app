class RenameColumNameInVacationSpots < ActiveRecord::Migration
  def change
    rename_column :vacation_spots, :lng, :lat
    rename_column :vacation_spots, :long, :lng
    add_column :vacation_spots, :street_number, :string
  end
end
