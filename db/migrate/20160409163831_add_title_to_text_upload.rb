class AddTitleToTextUpload < ActiveRecord::Migration
  def change
    add_column :text_uploads, :filename, :string
  end
end
