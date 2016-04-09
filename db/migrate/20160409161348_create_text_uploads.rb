class CreateTextUploads < ActiveRecord::Migration
  def change
    create_table :text_uploads do |t|
      t.text :body
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
