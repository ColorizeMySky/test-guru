# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create
  before_validation :set_next_question, on: :update

  attr_accessor :answer_ids

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question&.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end
end
