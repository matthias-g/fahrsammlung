class AddPublicAndPublicUntilToRequest < ActiveRecord::Migration[4.2]
  def change
    add_column :requests, :public, :boolean
    add_column :requests, :public_until, :datetime
  end
end
