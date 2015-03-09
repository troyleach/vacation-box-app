class AddZipToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :zip, :string
  end
end
