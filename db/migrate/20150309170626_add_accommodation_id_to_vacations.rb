class AddAccommodationIdToVacations < ActiveRecord::Migration
  def change
    add_column :vacations, :accommodation_id, :integer
  end
end
