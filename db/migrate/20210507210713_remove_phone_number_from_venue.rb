class RemovePhoneNumberFromVenue < ActiveRecord::Migration[6.1]
  def change
    remove_column :venues, :phone_number, :string
  end
end
