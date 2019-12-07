class AddCoordinatesToOffersAndRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :start_latitude, :float
    add_column :offers, :start_longitude, :float
    add_column :requests, :start_latitude, :float
    add_column :requests, :start_longitude, :float
  end
end
