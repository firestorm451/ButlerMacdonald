class Machine < ActiveRecord::Base
  has_many :job_machines
  has_many :jobs, through: :job_machines
  has_many :input_boxes, through: :job_machines
  has_many :output_boxes, through: :job_machines

  def sum_of_input_boxes
    input_boxes.sum(:material_weight)
  end

  def sum_of_output_boxes
    output_boxes.sum(:material_weight)
  end
  
end
