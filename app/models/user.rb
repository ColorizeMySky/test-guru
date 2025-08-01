# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :authored_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :restrict_with_error

  scope :tests_by_level, ->(level) { joins(:results).where(tests: { level: level }) }

  validates :email, presence: true
end
