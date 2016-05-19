class Machine < ActiveRecord::Base
  has_many :job_machines
  has_many :jobs, through: :job_machines
  has_many :input_boxes, through: :job_machines
  has_many :output_boxes, through: :job_machines
  validates_format_of :name, :with => /\A[a-zA-Z]+\Z/
  validates_length_of :name, :minimum => 2, :maximum => 25
  validates_presence_of :name

  def sum_of_input_boxes
    input_boxes.sum(:material_weight)
  end

  def sum_of_output_boxes
    output_boxes.sum(:material_weight)
  end

end
