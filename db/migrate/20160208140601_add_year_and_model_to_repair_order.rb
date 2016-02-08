class AddYearAndModelToRepairOrder < ActiveRecord::Migration
  def change
    add_column :repair_orders, :year, :integer
    add_column :repair_orders, :model, :string
  end
end
