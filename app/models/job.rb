class Job < ActiveRecord::Base
  has_many :job_machines, dependent: :destroy
  has_many :machines, through: :job_machines
  has_many :boxes, dependent: :destroy
  belongs_to :customer
  validates_presence_of :job_number, :customer_id
  validates_numericality_of :job_number

  accepts_nested_attributes_for :job_machines
  accepts_nested_attributes_for :boxes


  def ready_to_kick_off?
    machines.any? && boxes.any? && job_status != "active"
  end

  def kickoff!
    job_machines.where(step_number: 1).first.input_boxes << boxes.where(is_raw: true)
    self.job_status = "active"
    save!
  end

  def link_job_with_machine(machine)
    job_machines.find_by(machine_id: machine.id)
  end

  def on_hold!
    self.job_status = "hold"
    save!
  end

  def check_on_hold!
    self.job_status != "hold"
  end

  def sum_of_boxes
    boxes.where(is_raw: true).sum(:material_weight)
  end

end
