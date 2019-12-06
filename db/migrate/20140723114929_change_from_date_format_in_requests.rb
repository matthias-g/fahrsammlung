class ChangeFromDateFormatInRequests < ActiveRecord::Migration[4.2]
  def change
    change_column :requests, :from_date, :date
  end
end
