class AccessControlController < AuthenticationController

  def blocked
    if user_allowed?
      redirect_to root_path
    else
      render status: :forbidden
    end
  end

  def login
    if Hymnal.config.password && params[:password] == Hymnal.config.password
      session[:authenticated] = true
    end
    redirect_to blocked_path
  end

end
