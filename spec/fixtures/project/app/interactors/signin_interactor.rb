# frozen_string_literal: true

class SigninInteractor
  include Interactor::Organizer

  organize Signin::SetContext, Signin::ValidateUser, Signin::SendNotification
end
