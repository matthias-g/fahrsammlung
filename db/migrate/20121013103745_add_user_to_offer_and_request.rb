class AddUserToOfferAndRequest < ActiveRecord::Migration[4.2]
  def change
    add_column :offers, :user_id, :integer, null: false, default: 0
    add_column :requests, :user_id, :integer, null: false, default: 0
  end
end
