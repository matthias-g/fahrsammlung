class ChangeFromDateFormatInOffers < ActiveRecord::Migration[4.2]
  def change
    change_column :offers, :from_date, :date
  end
end
