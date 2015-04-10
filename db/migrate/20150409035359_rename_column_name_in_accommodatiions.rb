class RenameColumnNameInAccommodatiions < ActiveRecord::Migration
  def change
    rename_column :accommodations, :lat, :latitude
    rename_column :accommodations, :long, :longitude
  end
end
