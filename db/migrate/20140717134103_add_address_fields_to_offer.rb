class AddAddressFieldsToOffer < ActiveRecord::Migration[4.2]
  def change
    add_column :offers, :district, :string
    add_column :offers, :street, :string
    add_column :offers, :zip_code, :string
  end
end
