class Machine < ActiveRecord::Base
  has_many :job_machines
  has_many :jobs, through: :job_machines
  has_many :input_boxes, through: :job_machines
  has_many :output_boxes, through: :job_machines
end
