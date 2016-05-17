class AddDestroyedToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :destroyer, :boolean, default: false
  end
end
