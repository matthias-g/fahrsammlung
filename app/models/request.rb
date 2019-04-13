class Request < ApplicationRecord
  include Item

  validates_presence_of :title, :start_location
  validates_length_of :title, maximum: 140

end
