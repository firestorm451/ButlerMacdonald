class CreateJobMachines < ActiveRecord::Migration
  def change
    create_table :job_machines do |t|
      t.references :job, index: true, foreign_key: true
      t.references :machine, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
