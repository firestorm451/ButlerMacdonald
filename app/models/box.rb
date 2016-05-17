class Box < ActiveRecord::Base
  belongs_to :location
  belongs_to :material
  belongs_to :job
  belongs_to :input_job_machine, class_name: JobMachine, foreign_key: "input_id"
  belongs_to :output_job_machine, class_name: JobMachine, foreign_key: "output_id"
  validates_presence_of :location, :job, :material_weight
  validates :material_weight, numericality: {
    :greater_than => 1,
    :less_than => 3000
  }



  default_scope { where(destroyer: false) }
  # validates :input_job_machine, presence: true, unless: ->(box){box.output_job_machine.present?}
  # validates :output_job_machine, presence: true, unless: ->(box){box.input_job_machine.present?}

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :material
end
