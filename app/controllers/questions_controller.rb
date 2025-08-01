# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    @questions = @test.questions
    render json: @questions
  end

  def show
    render json: @question
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to test_questions_path(@test)
    else
      flash[:notice] = 'Не удалось создать вопрос'
      render :new
    end
  end

  def destroy
    @question.destroy
    render html: "<div>Вопрос удалён</div><div><b>ID: #{@question.id}</b></div>".html_safe
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: 'Question was not found', status: :not_found
  end

  def question_params
    params.require(:question).permit(:text)
  end
end
