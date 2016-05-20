class Material < ActiveRecord::Base
  has_many :boxes
  has_many :material, through: :boxes
  validates_format_of :name, :with => /\A[a-zA-Z]+\Z/
  validates_length_of :name, within: 2..25
  validates_presence_of :name

end
