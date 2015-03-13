class FixColumnNameInProfiles < ActiveRecord::Migration
  def change
    rename_column :profiles, :lat, :latitude
    rename_column :profiles, :long, :longitude
  end
end
