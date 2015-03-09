class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.string :vacation_name
      t.string :city
      t.string :state
      t.float :lat
      t.float :long
      t.integer :arrive_by, default: 0
      t.integer :transpertation, default: 0
      t.text :note
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
