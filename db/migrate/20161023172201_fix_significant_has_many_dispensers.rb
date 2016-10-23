class FixSignificantHasManyDispensers < ActiveRecord::Migration
  def change
    add_column :dispensers, :significant_id, :integer
    remove_column :significants, :dispenser_id
  end
end
