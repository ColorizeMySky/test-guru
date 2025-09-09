# frozen_string_literal: true

class FeedbackController < ApplicationController
  def new; end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]

    FeedbackMailer.feedback_email(name, email, message).deliver_now

    redirect_to root_path, notice: t('feedback.success')
  end
end
