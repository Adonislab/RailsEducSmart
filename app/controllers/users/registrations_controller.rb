# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: { status: 'success', message: 'Signed up successfully.', data: resource }, status: :ok
      else
        render json: { status: 'error', message: resource.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    end
end
