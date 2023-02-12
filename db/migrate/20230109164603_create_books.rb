class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :year
      t.string :company
      t.text :learn
      t.text :practice

      t.timestamps
    end
  end
end
