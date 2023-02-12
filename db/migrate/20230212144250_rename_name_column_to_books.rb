class RenameNameColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :name, :namer
  end
end
