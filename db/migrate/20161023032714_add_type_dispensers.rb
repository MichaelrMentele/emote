class AddTypeDispensers < ActiveRecord::Migration
  def change
    add_column :dispensers, :type, :string 
  end
end
