class Customer < ActiveRecord::Base
  has_many :jobs
  validates_presence_of :name
  validates_length_of :name, :minimum => 2, :maximum => 25
  validates_format_of :name, :with => /\A[a-zA-Z]+\Z/
end
