class AddStepNumberToJobMachines < ActiveRecord::Migration
  def change
    add_column :job_machines, :step_number, :integer
  end
end
