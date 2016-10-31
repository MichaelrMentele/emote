class AddColumnDeliveryTimeToMessengers < ActiveRecord::Migration
  def change
    add_column :dispensers, :delivery_time, :datetime
  end
end
