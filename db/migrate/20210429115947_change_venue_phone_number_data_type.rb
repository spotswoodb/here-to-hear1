class ChangeVenuePhoneNumberDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :venues, :phone_number, :string
  end
end
