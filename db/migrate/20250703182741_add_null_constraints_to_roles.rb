class AddNullConstraintsToRoles < ActiveRecord::Migration[7.1]
  def change
    change_column_null :roles, :name, false
  end
end
