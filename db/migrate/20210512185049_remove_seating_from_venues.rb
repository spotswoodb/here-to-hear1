class RemoveSeatingFromVenues < ActiveRecord::Migration[6.1]
  def change
    remove_column :venues, :seating
  end
end
