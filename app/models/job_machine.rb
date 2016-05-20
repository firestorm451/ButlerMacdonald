class JobMachine < ActiveRecord::Base
  belongs_to :job
  belongs_to :machine
  belongs_to :user
  has_many :input_boxes, class_name: Box, foreign_key: "input_id"
  has_many :output_boxes, class_name: Box, foreign_key: "output_id"
  validates :step_number, uniqueness: {scope: :job_id}, allow_nil: true
  validates_numericality_of :step_number, :greater_than_or_equal_to => 0, allow_nil: true

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
