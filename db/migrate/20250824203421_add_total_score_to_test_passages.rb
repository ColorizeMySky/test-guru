class AddTotalScoreToTestPassages < ActiveRecord::Migration[7.1]
  def change
    add_column :test_passages, :total_score, :integer, default: 0
  end
end
