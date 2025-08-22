class AddNameAndTyprAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :last_name, :string
  end
end
