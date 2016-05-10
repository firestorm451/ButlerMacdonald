class Box < ActiveRecord::Base
  belongs_to :location
  belongs_to :material
  belongs_to :job

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :material
end
