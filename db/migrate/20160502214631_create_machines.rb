class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.string :status, default: 'active'

      t.timestamps null: false
    end
  end
end
