class AddSeatingToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :seating, :string
  end
end
