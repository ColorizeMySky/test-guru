# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("JOIN results ON results.test_id = tests.id")
        .where("results.user_id = ? AND tests.level = ?", self.id, level)
  end
end
