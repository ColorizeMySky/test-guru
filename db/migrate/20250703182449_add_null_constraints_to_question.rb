class AddNullConstraintsToQuestion < ActiveRecord::Migration[7.1]
  def change
    change_column_null :questions, :text, false
    change_column_null :questions, :score, false
  end
end
