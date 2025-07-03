class CreateTestsQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :tests_questions do |t|
      t.references :test, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
