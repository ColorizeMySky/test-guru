class AddIndexes < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :type
    add_index :categories, :name
    add_index :tests, :name
  end
end
