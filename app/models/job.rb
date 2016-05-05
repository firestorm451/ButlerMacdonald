class Job < ActiveRecord::Base
  has_many :job_machines
  has_many :machines, through: :job_machines
  has_many :boxes
end
