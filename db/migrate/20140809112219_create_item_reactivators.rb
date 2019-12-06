class CreateItemReactivators < ActiveRecord::Migration[4.2]
  def change
    create_table :item_reactivators do |t|
      t.string :token
      t.index :token, unique: true
      t.references :item, index: true, polymorphic: true

      t.timestamps
    end
  end
end
