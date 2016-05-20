class Box < ActiveRecord::Base
  belongs_to :location
  belongs_to :material
  belongs_to :job
  belongs_to :input_job_machine, class_name: JobMachine, foreign_key: "input_id"
  belongs_to :output_job_machine, class_name: JobMachine, foreign_key: "output_id"
  validates_presence_of :location, :job, :material_weight, :material
  validates :material_weight, numericality: {
    :greater_than => 1,
    :less_than => 3000
  }

  default_scope { where(destroyer: false) }

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :material

  def ready_to_move_on_box?
    !(input_id || location.name == "Discard" || is_final == true || %w(Trash Fines).include?(material.name))
  end
end
