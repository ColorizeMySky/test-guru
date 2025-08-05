# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index show edit update destroy new create]
  before_action :set_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    @questions = @test.questions
  end

  def show
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

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to test_question_path(@test, @question)
    else
      render :edit
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
