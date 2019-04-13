class Offer < ApplicationRecord
  include Item

  validates_presence_of :title, :description, :start_time, :start_date, :start_location, :seat_count
  validates_length_of :title, maximum: 140

end
