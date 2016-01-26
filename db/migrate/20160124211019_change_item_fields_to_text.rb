class ChangeItemFieldsToText < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.change :cause, :text
      t.change :correction, :text
    end
  end
end
