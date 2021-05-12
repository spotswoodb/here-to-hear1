class AddSeatingToVenues < ActiveRecord::Migration[6.1]
  def change
    add_column :venues, :seating, :string
  end
end
