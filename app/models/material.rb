class Material < ActiveRecord::Base
  has_many :boxes
  has_many :material, through: :boxes
end
