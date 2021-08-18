class ApplicationController < ActionController::Base
    #CRRLLL
    
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        if !logged_in?
            redirect_to new_session_url
        end
    end

    def require_logged_out
        if logged_in?
            redirect_to users_url
        end
    end

    def logged_in?
        !!current_user
    end

    def login(user)

    end

    def logout!

    end
end
