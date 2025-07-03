class CreateQuestionTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :question_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :question_types, :name, unique: true
  end
end
