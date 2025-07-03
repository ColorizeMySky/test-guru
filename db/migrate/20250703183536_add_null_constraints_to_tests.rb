class AddNullConstraintsToTests < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tests, :name, false
    change_column_null :tests, :level, false
  end
end
