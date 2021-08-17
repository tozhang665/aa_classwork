class ApplicationController < ActionController::Base
    # crrlll

    helper_method :current_user, :logged_in?

    def current_user
        # return current user
            # finds session token and check if it is equal to cookie's session token
        @current_user ||= User.find_by(session_token:session[:session_token])
    end

    def require_logged_in
      # redirect_to new_sessions_url unless logged_in?
    end

    def require_logged_out
      redirect_to cats_url if logged_in?
    end

    def login(user)
        # resets the session token & saves new one into cookies
        session[:session_token] = user.reset_session_token!
    end

    def logged_in?
        !!current_user
    end

    def logout!
      current_user.reset_session_token! if logged_in?
      session[:session_token] = nil
      @current_user = nil
    end
end
