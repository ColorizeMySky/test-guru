class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index new create]

  skip_before_action :verify_authenticity_token, only: [:create, :destroy] # для отладки

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found


  def index
    @questions = @test.questions
    render json: @questions
  end

  def show
    @question = Question.find(params[:id])
    render json: @question
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(params.permit(:text).merge(score: 1))

    create_answers

    if @question.save
      redirect_to test_questions_path(@test)
    else
      flash[:notice] = 'Не удалось создать вопрос'
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @test = @question.test
    @question.destroy
    render html: "<div>Вопрос удалён</div><div><b>ID: #{@question.id}</b></div>".html_safe
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_not_found
    render plain: 'Question was not found', status: :not_found
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def create_answers
    return unless params[:answers]

    params.require(:answers).permit!.each do |_key, answer_data|
      next if answer_data[:answer_text].blank?
      @question.answers.build(
        answer_text: answer_data[:answer_text],
        is_correct: answer_data[:is_correct] == "1"
      )
    end
  end
end