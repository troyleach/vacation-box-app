class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :vacations, :lat, :latitude
    rename_column :vacations, :long, :longitude
  end
end