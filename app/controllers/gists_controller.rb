# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @question = @test_passage.current_question

    redirect_to @test_passage, alert: 'Нет текущего вопроса' unless @question

    if @question
      result = GistQuestionService.new(@question, @test_passage).call
      flash_options = if result.success?
                        { notice: t('gists.create.success', gist_url: result.url) }
                      else
                        { alert: t('gists.create.failure') }
                      end
    else
      flash_options = { alert: 'Нет текущего вопроса' }
    end

    redirect_to @test_passage, flash_options
  end
end
