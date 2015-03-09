class CreateVacationAccommodations < ActiveRecord::Migration
  def change
    create_table :vacation_accommodations do |t|
      t.integer :vacation_id
      t.integer :accommodation_id

      t.timestamps null: false
    end
  end
end
