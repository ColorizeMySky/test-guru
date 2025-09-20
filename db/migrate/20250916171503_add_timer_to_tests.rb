class AddTimerToTests < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :timer, :integer, default: nil
    add_column :test_passages, :timer_started_at, :datetime
  end
end
