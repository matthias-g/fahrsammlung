class UpdateOfferFields < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :start_location, :string
    add_column :offers, :seat_count, :integer
    add_column :offers, :start_date, :date
    add_column :offers, :start_time, :string
    remove_column :offers, :district
    remove_column :offers, :gender
    remove_column :offers, :from_date
    remove_column :offers, :to_date
    remove_column :offers, :rent
    remove_column :offers, :size
    remove_column :offers, :street
    remove_column :offers, :zip_code
  end
end
