class UpdateRequestFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :gender
    remove_column :requests, :to_date
    remove_column :requests, :from_date
    add_column :requests, :start_location, :string
  end
end
