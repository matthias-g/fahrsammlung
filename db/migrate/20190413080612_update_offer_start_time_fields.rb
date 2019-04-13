class UpdateOfferStartTimeFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :offers, :start_time, :datetime
    add_column :offers, :start_date, :date
    add_column :offers, :start_time, :string
  end
end
