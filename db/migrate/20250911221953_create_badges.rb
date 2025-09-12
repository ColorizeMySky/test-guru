class CreateBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :rule_type
      t.string :value

      t.timestamps null: false
    end
  end
end
