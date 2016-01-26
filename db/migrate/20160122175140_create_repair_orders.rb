class CreateRepairOrders < ActiveRecord::Migration
  def change
    create_table :repair_orders do |t|
      t.integer :ro_number
      t.text :recommendations
      t.text :maintenance

      t.timestamps null: false
    end
  end
end
