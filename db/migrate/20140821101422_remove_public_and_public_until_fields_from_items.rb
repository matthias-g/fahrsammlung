class RemovePublicAndPublicUntilFieldsFromItems < ActiveRecord::Migration[4.2]
  def change
    remove_column :offers, :public, :boolean
    remove_column :offers, :public_until, :datetime
    remove_column :requests, :public, :boolean
    remove_column :requests, :public_until, :datetime
  end
end
