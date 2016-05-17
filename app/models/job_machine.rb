class JobMachine < ActiveRecord::Base
  belongs_to :job
  belongs_to :machine
  belongs_to :user
  has_many :input_boxes, class_name: Box, foreign_key: "input_id"
  has_many :output_boxes, class_name: Box, foreign_key: "output_id"

  def sum_of_input_boxes
    input_boxes.sum(:material_weight)
  end

  def sum_of_output_boxes
    output_boxes.sum(:material_weight)
  end

  def next_machine
    job.job_machines.find_by(step_number: step_number + 1)
  end

end
