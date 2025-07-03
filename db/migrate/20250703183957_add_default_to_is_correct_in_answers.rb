class AddDefaultToIsCorrectInAnswers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :answers, :is_correct, from: nil, to: false
  end
end
