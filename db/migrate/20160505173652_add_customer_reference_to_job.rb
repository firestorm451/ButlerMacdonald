class AddCustomerReferenceToJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :customer_id
    add_reference :jobs, :customer, index: true, foreign_key: true
  end
end
