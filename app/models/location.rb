class Location < ActiveRecord::Base
  has_many :boxes
  validates_length_of :name, within: 2..7
  validates_presence_of :name
  validates_format_of :name, :with => /\A[a-zA-Z0-9]+\Z/
end
