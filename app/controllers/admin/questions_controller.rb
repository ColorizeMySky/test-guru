# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :set_test, only: %i[new create edit update]
  before_action :set_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def show; end

  def new
    @question = @test.questions.build
    4.times { @question.answers.build }
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to admin_test_path(@test)
    else
      flash[:notice] = 'Не удалось создать вопрос'
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
    @test = @question.test
  end

  def question_not_found
    render plain: 'Question was not found', status: :not_found
  end

  def question_params
    params.require(:question).permit(:text, :score, answers_attributes: %i[id answer_text is_correct _destroy])
  end
end
