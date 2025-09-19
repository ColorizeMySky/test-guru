# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    return render :show unless @test_passage.completed?

    if @test_passage.expired_by_timer
      redirect_to result_test_passage_path(@test_passage), alert: 'Время вышло. Тест завершён.'
    else
      handle_completed_test
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def send_completion_email
    TestsMailer.completed_test(@test_passage).deliver_now
  rescue Net::SMTPAuthenticationError, Net::SMTPError, IOError => e
    Rails.logger.error "Failed to send email: #{e.message}"
  end

  def handle_completed_test
    AwardBadgeService.call(@test_passage)
    send_completion_email
    redirect_to result_test_passage_path(@test_passage)
  end
end
