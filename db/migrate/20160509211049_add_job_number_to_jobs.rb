class AddJobNumberToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :job_number, :integer
  end
end
