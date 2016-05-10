class Job < ActiveRecord::Base
  has_many :job_machines
  has_many :machines, through: :job_machines
  has_many :boxes
  belongs_to :customer

  accepts_nested_attributes_for :job_machines
  accepts_nested_attributes_for :boxes
end
