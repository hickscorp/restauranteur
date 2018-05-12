class ApplicationController < ActionController::Base
  protect_from_forgery    with: :exception
  helper_method           :signed_in?, :signed_in_as?, :current_user
  before_filter           { I18n.locale = http_accept_language.compatible_language_from I18n.available_locales }

  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    render json: {}, status: 403, layout: false
  end

  # Sign a user in and out.
  def sign_in (user, remember=false)
    cookies[:remember_token]  = user.remember_token
    self.current_user         = user
  end
  def sign_out
    self.current_user   = nil
    cookies.delete :remember_token
  end

  # Flag to know wether a user is signed in.
  def signed_in?
    !current_user.nil?
  end
  # Tests signed-in user.
  def signed_in_as? (user)
    return signed_in? && current_user==user
  end

  # Returns the currently signed-in user.
  def current_user
    @current_user   ||= User.find_by_remember_token(cookies[:remember_token]) if cookies[:remember_token]
  end
  # Current user assignation.
  def current_user= (user)
    @current_user   = user
  end
end
