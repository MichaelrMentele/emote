class CreateDispensers < ActiveRecord::Migration
  def change
    create_table :dispensers do |t|
      t.integer :user_id, :significant_id
      t.timestamps
    end
  end
end
