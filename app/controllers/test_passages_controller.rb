# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    return handle_timer_expired if @test_passage.timer_expired?

    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      handle_completed_test
    else
      render :show
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

  def handle_timer_expired
    @test_passage.expire!
    redirect_to result_test_passage_path(@test_passage), alert: 'Время вышло. Тест завершён.'
  end

  def handle_completed_test
    AwardBadgeService.call(@test_passage)
    send_completion_email
    redirect_to result_test_passage_path(@test_passage)
  end
end
