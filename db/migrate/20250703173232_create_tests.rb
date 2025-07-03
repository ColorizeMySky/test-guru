class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :level
      t.references :category, null: false, foreign_key: true
      t.integer :timer
      t.string :status

      t.timestamps
    end
    add_index :tests, :name, unique: true
  end
end
