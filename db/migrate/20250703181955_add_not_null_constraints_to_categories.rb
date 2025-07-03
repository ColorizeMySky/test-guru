class AddNotNullConstraintsToCategories < ActiveRecord::Migration[7.1]
  def change
    change_column_null :categories, :name, false
    change_column_null :categories, :description, false
  end
end
