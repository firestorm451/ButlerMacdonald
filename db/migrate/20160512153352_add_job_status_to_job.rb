class AddJobStatusToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :job_status, :text
  end
end
