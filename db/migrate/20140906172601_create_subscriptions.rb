class CreateSubscriptions < ActiveRecord::Migration[4.2]
  def change
    create_table :subscriptions do |t|
      t.string :email, unique: true
      t.boolean :offers, default: false
      t.boolean :requests, default: false
      t.string :confirmation_token

      t.timestamps
    end
  end
end
