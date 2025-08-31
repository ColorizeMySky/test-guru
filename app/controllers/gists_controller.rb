# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @question = @test_passage.current_question

    return redirect_to_questionless unless @question

    result = GistQuestionService.new(@question, @test_passage).call
    flash_options(result)
    redirect_to @test_passage, @flash_options
  end

  private

  def redirect_to_questionless
    redirect_to @test_passage, alert: 'Нет текущего вопроса'
  end

  def flash_options(result)
    @flash_options = if result.success?
                       { notice: t('gists.create.success', gist_url: result.url) }
                     else
                       { alert: t('gists.create.failure') }
                     end
  end
end
