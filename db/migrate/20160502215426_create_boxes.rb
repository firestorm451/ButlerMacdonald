class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.references :location, index: true, foreign_key: true
      t.integer :material_weight
      t.references :material, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.integer :output_id
      t.integer :input_id
      t.boolean :is_final, default: false
      t.boolean :is_raw, default: false

      t.timestamps null: false
    end
  end
end
