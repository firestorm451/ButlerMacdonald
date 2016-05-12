class Job < ActiveRecord::Base
  has_many :job_machines
  has_many :machines, through: :job_machines
  has_many :boxes, dependent: :destroy
  belongs_to :customer
  validates_presence_of :job_number, :customer_id
  validates_numericality_of :job_number

  accepts_nested_attributes_for :job_machines
  accepts_nested_attributes_for :boxes
end
