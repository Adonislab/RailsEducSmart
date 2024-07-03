# frozen_string_literal: true


class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      sign_in user
      respond_with user, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def respond_with(resource, _opts = {})
    render json: { status: 'success', message: 'Logged in successfully.', email: resource.email }, status: :ok
  end

  def respond_to_on_destroy
    head :no_content
  end
end
