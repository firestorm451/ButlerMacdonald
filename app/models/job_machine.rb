class JobMachine < ActiveRecord::Base
  belongs_to :job
  belongs_to :machine
  belongs_to :user
  has_many :input_boxes, class_name: Box, foreign_key: "input_id"
  has_many :output_boxes, class_name: Box, foreign_key: "output_id"
end
