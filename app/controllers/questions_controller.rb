# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def show; end

  private

  def set_question
    @question = Question.find(params[:id])
    @test = @question.test
  end

  def question_not_found
    render plain: 'Question was not found', status: :not_found
  end
end
