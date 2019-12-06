class CreateRequests < ActiveRecord::Migration[4.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.date :until

      t.timestamps
    end
  end
end
