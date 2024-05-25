# frozen_string_literal: true

class SendEmailNotificationInteractor
  include Interactor::Organizer

  organize SendEmailNotification::SetContext,
    SendEmailNotification::ValidateEmail,
    SendEmailNotification::SendEmail
end
