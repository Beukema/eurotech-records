class CreateRepairOrderRecords < ActiveRecord::Migration
  def change
    create_table :repair_order_records do |t|
      t.integer :repair_order
      t.text :recommendations
      t.text :maintenance

      t.timestamps null: false
    end
  end
end
