class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by ignoring the session
  protect_from_forgery
  delegate :tm, to: :view_context

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  after_action :store_location

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  def store_location
    if request.path != new_user_session_path &&
      request.path != new_user_registration_path &&
      request.path != new_user_password_path &&
      request.path != edit_user_password_path &&
      request.path != user_confirmation_path &&
      request.path != destroy_user_session_path &&
      !request.xhr? # don't store ajax calls
      store_location_for(:user, request.original_url)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    (I18n.locale == :en) ? options : options.merge(locale: I18n.locale)
  end

  def verify_captcha
    params[:stupid_captcha] == "Maria"
  end

  def owner_show_item_path(item)
    if item.is_a?(Offer)
      owner_show_offer_path(item, token: item.owner_show_token)
    elsif item.is_a?(Request)
      owner_show_request_path(item, token: item.owner_show_token)
    end
  end

end
