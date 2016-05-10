class Box < ActiveRecord::Base
  belongs_to :location
  belongs_to :material
  belongs_to :job
  validates_presence_of :location, :job, :material_weight

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :material
end
