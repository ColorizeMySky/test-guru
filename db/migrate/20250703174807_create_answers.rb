class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.string :answer_text
      t.boolean :is_correct
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
