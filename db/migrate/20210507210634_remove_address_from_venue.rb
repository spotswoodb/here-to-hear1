class RemoveAddressFromVenue < ActiveRecord::Migration[6.1]
  def change
    remove_column :venues, :address, :string
  end
end
