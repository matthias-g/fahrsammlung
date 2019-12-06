class AddPublicAndPublicUntilToOffer < ActiveRecord::Migration[4.2]
  def change
    add_column :offers, :public, :boolean
    add_column :offers, :public_until, :datetime
  end
end
