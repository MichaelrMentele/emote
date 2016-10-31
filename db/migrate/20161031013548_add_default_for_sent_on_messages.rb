class AddDefaultForSentOnMessages < ActiveRecord::Migration
  def change
    change_column :messages, :sent, :boolean, :default => false
  end
end
