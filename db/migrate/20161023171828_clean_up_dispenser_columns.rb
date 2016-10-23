class CleanUpDispenserColumns < ActiveRecord::Migration
  def change
    remove_column :dispensers, :significant_id
    remove_column :dispensers, :type
  end
end
