class Machine < ActiveRecord::Base
  has_many :job_machines
  has_many :jobs, through: :job_machines
end
