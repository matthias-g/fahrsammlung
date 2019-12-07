class Offer < ApplicationRecord
  include Item

  validates_presence_of :title, :start_time, :start_date, :seat_count
  validates_length_of :title, maximum: 140

end
