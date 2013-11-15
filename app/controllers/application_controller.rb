class ApplicationController < ActionController::Base
  check_authorization unless Settings.auth.bypass_all #for cancan
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
    if !Settings.auth.bypass_all
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      User.create({provider: "test suite", name: "tester", uid: "sada3w232", roles: ["user"]})
    end
  end
end
