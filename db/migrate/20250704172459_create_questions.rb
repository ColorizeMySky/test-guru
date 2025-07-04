class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.integer :score, null: false
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
    add_index :questions, :text, unique: true
  end
end
