class AddFieldsToRequest < ActiveRecord::Migration[4.2]
  def change
    add_column :requests, :from_date, :datetime
    rename_column :requests, :until, :to_date
    add_column :requests, :gender, :integer
  end
end
