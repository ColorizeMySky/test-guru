# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def success_rate
    return 0 if test.questions.empty?

    (correct_questions.to_f / test.questions.count) * 100
  end

  def successful?
    success_rate >= 85
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def next_question
    return nil unless test.present?

    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.pluck(:id).sort == answer_ids.map(&:to_i).uniq.sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
