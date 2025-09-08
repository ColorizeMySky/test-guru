# frozen_string_literal: true

class FeedbackMailer < ApplicationMailer
  def feedback_email(name, email, message)
    @name = name
    @email = email
    @message = message

    return unless admin_emails.present?

    mail(
      to: admin_emails,
      from: ENV['SMTP_USERNAME'],
      reply_to: @email,
      subject: 'Новое сообщение из формы обратной связи'
    )
  end

  private

  def admin_emails
    User.where(type: 'Admin').pluck(:email)
  end
end
