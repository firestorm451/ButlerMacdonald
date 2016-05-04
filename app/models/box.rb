class Box < ActiveRecord::Base
  belongs_to :location
  belongs_to :material
  belongs_to :job
end
