class AddCityandStateandZipToVacationSpots < ActiveRecord::Migration
  def change
    add_column :vacation_spots, :city, :string
    add_column :vacation_spots, :state, :string
    add_column :vacation_spots, :zip, :string
  end
end
