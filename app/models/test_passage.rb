# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  after_initialize :set_timer_started_at, if: :new_record?
  after_initialize :set_current_question, if: :new_record?

  attr_accessor :answer_ids, :expired_by_timer

  SUCCESS_RATE_LEVEL = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    return expire! if timer_expired?

    return if completed?

    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.total_score += current_question.score if current_question.present?

    set_current_question
    save!
  end

  def success_rate
    return 0 if test.questions.empty?

    (correct_questions.to_f / test.questions.count) * 100
  end

  def successful?
    success_rate >= SUCCESS_RATE_LEVEL
  end

  def current_question_number
    return 0 if current_question.nil?

    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def time_left
    return nil unless test.timer.present? && timer_started_at.present?

    [test.timer * 60 - (Time.current - timer_started_at).to_i, 0].max
  end

  def timer_expired?
    test.timer.present? && time_left <= 0
  end

  def expire!
    self.current_question = nil
    self.expired_by_timer = true
    save!
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
    return false if answer_ids.nil?

    correct_answers.pluck(:id).sort == answer_ids.map(&:to_i).uniq.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def set_timer_started_at
    return if timer_started_at.present?

    self.timer_started_at = Time.current if test.timer.present? && timer_started_at.nil?
  end
end
