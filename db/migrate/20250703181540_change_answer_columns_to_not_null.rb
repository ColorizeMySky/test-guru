class ChangeAnswerColumnsToNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :answers, :answer_text, false
    change_column_null :answers, :is_correct, false
  end
end
