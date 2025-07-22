class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.boolean :passed
      t.integer :score
      t.float :correct_percentage
      t.datetime :time
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
