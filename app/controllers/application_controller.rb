class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception

  before_action :check_access_control

  protected

  def check_access_control
    redirect_to blocked_path unless user_allowed?
  end

  def user_allowed?
    Hymnal.config.acl.allow?(request.remote_ip) || session[:authenticated]
  end

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

end
