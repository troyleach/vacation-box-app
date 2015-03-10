class CreateVacationSpots < ActiveRecord::Migration
  def change
    create_table :vacation_spots do |t|
      t.float :lat
      t.float :long
      t.string :image
      t.string :spot_name
      t.text :description
      t.string :address
      t.string :phone
      t.string :hours
      t.datetime :reservation
      t.string :website
      t.text :note
      t.integer :vacation_id

      t.timestamps null: false
    end
  end
end
