# frozen_string_literal: true

class Admin::AnswersController < Admin::BaseController
  before_action :set_question, only: %i[new create edit update]
  before_action :set_answer, only: %i[edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :answer_not_found

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to admin_test_question_path(@question.test, @question)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to admin_test_question_path(@question.test, @question)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_test_question_path(@question.test, @question)
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def answer_not_found
    render plain: 'Не удалось найти вопрос', status: :not_found
  end

  def answer_params
    params.require(:answer).permit(:text, :correct)
  end
end
