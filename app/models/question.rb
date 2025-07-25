# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :text, presence: true
  validate :answers_count_valid?

  private

  def answers_count_valid?
    errors.add(:base, 'У одного Вопроса может быть от 1-го до 4-х ответов.') if answers.size < 1 || answers.size > 4
  end
end
