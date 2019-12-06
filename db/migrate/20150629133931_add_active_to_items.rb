class AddActiveToItems < ActiveRecord::Migration[4.2]
  def change
    add_column :offers, :active, :boolean, default: true
    add_column :requests, :active, :boolean, default: true
  end
end
