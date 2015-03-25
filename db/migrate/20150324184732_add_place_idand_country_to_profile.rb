class AddPlaceIdandCountryToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :place_id, :string
    add_column :profiles, :country, :string
  end
end
