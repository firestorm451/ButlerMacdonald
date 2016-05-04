class JobMachine < ActiveRecord::Base
  belongs_to :job
  belongs_to :machine
  belongs_to :user
end
