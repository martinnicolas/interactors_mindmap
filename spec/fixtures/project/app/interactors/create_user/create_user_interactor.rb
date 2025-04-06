# frozen_string_literal: true

class CreateUserInteractor
  include Interactor::Organizer

  organize CreateUser::SetContext,
    CreateUser::Save,
    CreateUser::SendWelcomeEmail
end
