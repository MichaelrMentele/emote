class AddDispenerPurpose < ActiveRecord::Migration
  def change
    add_column :dispensers, :purpose_statement, :string
  end
end
