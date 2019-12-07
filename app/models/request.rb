class Request < ApplicationRecord
  include Item

  validates_presence_of :title
  validates_length_of :title, maximum: 140

end
