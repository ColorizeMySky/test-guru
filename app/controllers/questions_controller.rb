class QuestionsController < ApplicationController
  def index
    @test = Test.find(params[:test_id])
    @questions = @test.questions
    render json: @questions
  end

  def show
    @question = Question.find(params[:id])
    render json: @question
  end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.build
  end

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.build(params.permit(:text).merge(score: 1))

    create_answers

    if @question.save
      redirect_to test_questions_path(@test), notice: 'Вопрос создан'
    else
      render :new
    end
  end

  private

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