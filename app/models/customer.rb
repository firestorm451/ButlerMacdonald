class Customer < ActiveRecord::Base
  has_many :jobs
  validates_presence_of :name
  validates_length_of :name, within: 2..25
  validates_format_of :name, :with => /\A[a-zA-Z]+\Z/
end
