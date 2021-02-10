class ApplicationController < ActionController::Base
  helper_method :loggedin?, :current_user

  def login!(user)
    user.reset_session_token!
    self.session[:session_token] = user.session_token 
    user.session_token 
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def loggedin?
    !!current_user
  end

  def logout!
    current_user.reset_session_token! if loggedin?
    session[:session_token] = nil
    @current_user = nil 
  end

  def require_logged_in
    redirect_to new_session_url unless loggedin?
end

  def require_logged_out
    if loggedin?
      render json: "please log out before creating a new user"
    end
  end 
end
