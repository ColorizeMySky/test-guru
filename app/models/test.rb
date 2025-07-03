class Test < ApplicationRecord
  belongs_to :category
  has_one :answer
  has_many :tests_questions
  has_many :questions, through: :tests_questions
end
