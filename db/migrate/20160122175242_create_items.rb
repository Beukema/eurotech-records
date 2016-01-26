class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :cause
      t.text :correction
      t.integer :repair_order_id

      t.timestamps null: false
    end
  end
end
