class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :customer_id
      t.text :description
      t.integer :estimated_yield

      t.timestamps null: false
    end
  end
end
