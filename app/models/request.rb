class Request < ApplicationRecord
  include Item

  validates_presence_of :title, :description, :start_location
  validates_length_of :title, maximum: 140

end
