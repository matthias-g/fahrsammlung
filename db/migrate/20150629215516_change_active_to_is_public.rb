class ChangeActiveToIsPublic < ActiveRecord::Migration[4.2]
  def change
    rename_column :offers, :active, :is_public
    rename_column :requests, :active, :is_public
  end
end
