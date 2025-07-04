class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :name, null: false
      t.integer :level, null: false, default: 1
      t.references :category, null: false, foreign_key: true
      t.integer :author_id, null: false

      t.timestamps
    end
    add_index :tests, :name, unique: true
  end
end
