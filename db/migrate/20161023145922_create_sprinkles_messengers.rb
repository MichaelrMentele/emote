class CreateSprinklesMessengers < ActiveRecord::Migration
  def change
    create_table :sprinkles_messengers do |t|
      t.integer :frequency
      t.integer :period
    end
  end
end
