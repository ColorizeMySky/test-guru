# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(is_correct: true) }

  validates :answer_text, presence: true
end
