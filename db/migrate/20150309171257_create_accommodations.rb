class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :phone
      t.string :website
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
