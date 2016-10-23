class CreateSignificants < ActiveRecord::Migration
  def change
    create_table :significants do |t|
      t.integer :user_id, :dispenser_id
      t.string :name
      t.string :phone
      t.timestamps
    end
  end
end
