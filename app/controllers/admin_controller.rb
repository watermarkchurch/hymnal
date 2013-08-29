class AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :check_access_control, only: []
end
