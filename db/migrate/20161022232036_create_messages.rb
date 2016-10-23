class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, :dispenser_id
      t.text :message
      t.string :emoji
      t.timestamps
    end
  end
end
