class AddUnsubscribeTokenToSubscriptions < ActiveRecord::Migration[4.2]
  def change
    add_column :subscriptions, :unsubscribe_token, :string
    add_index :subscriptions, :unsubscribe_token, unique: true
    add_index :subscriptions, :confirmation_token
    add_index :subscriptions, :email
    add_index :subscriptions, :offers
    add_index :subscriptions, :requests
  end
end
