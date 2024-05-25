# frozen_string_literal: true

class SignupInteractor
  include Interactor::Organizer

  organize Signup::SetContext,
    Signup::ValidateUser,
    Signup::CreateUser,
    SendEmailNotificationInteractor,
    Signup::CreateSession
end
