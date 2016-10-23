class AddPolymorphismToDispensers < ActiveRecord::Migration
  def change
    add_column :dispensers, :dispensable_type, :string
    add_column :dispensers, :dispensable_id, :integer
  end
end
