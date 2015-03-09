class RemoveAccommodationIdFromVacations < ActiveRecord::Migration
  def change
    remove_column :vacations, :accommodation_id, :integer
  end
end
