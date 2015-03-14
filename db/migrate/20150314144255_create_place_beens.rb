class CreatePlaceBeens < ActiveRecord::Migration
  def change
    create_table :place_beens do |t|
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.string :address
      t.text :description
      t.string :title

      t.timestamps null: false
    end
  end
end
