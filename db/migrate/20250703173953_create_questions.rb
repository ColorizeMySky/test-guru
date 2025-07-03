class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.references :question_type, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
    add_index :questions, :text, unique: true
  end
end
