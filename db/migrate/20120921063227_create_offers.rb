class CreateOffers < ActiveRecord::Migration[4.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.date :until

      t.timestamps
    end
  end
end
