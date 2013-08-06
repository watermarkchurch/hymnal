require 'ipaddr'

class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception

  before_action :check_access_control

  protected

  def check_access_control
    if Hymnal.config.acl.deny?(request.remote_ip)
      render '/blocked', status: :forbidden
    end
  end

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

end
