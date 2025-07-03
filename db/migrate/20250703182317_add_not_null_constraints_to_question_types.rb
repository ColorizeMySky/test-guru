class AddNotNullConstraintsToQuestionTypes < ActiveRecord::Migration[7.1]
  def change
    change_column_null :question_types, :name, false
  end
end
