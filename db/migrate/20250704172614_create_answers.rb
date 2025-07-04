class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.string :answer_text, null: false
      t.boolean :is_correct, null: false, default: false
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
