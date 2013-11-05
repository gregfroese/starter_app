class ApplicationController < ActionController::Base
  check_authorization #for cancan
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to unauthorized_path
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
