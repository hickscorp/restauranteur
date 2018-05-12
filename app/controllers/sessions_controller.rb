class SessionsController < ApplicationController
  skip_authorization_check
  respond_to      :json

  def create
    if (user=User.find_by_email(params.fetch(:email, '').downcase)) and user.authenticate(params.fetch(:password, ''))
      sign_in user, params[:remember_me]
      render json: current_user
    else
      render json: {}, status: :unauthorized
    end
  end

  def current
    if signed_in?
      render json: current_user
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    sign_out
    redirect_to root_path, flash: { success: 'You were signed out from the application.' }
  end

end
