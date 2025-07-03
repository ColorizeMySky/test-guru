class Question < ApplicationRecord
  belongs_to :question_type
  has_many :tests_questions
  has_many :tests, through: :tests_questions
end
