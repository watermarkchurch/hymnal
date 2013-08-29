class AuthenticationController < ApplicationController
  before_action :check_access_control, only: []
end
