class RenameTypeOnMaterials < ActiveRecord::Migration
  def change
    rename_column :materials, :type, :name
  end
end
