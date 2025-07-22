# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :authored_tests, foreign_key: 'author_id', class_name: 'Test'

  def tests_by_level(level)
    Test.joins("JOIN results ON results.test_id = tests.id")
        .where("results.user_id = ? AND tests.level = ?", self.id, level)
  end
end
