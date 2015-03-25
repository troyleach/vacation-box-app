class AddStreetNumberToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :street_number, :string
  end
end
