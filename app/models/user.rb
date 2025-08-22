# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :restrict_with_error

  scope :tests_by_level, ->(level) { joins(:results).where(tests: { level: level }) }

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
