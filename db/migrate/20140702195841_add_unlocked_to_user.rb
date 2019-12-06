class AddUnlockedToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :unlocked, :boolean, null: false, default: false
  end
end
