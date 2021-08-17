class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        #    Verify the user_name/password.
        @user =User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )
        if @user
            # Reset the User's session_token.
             # Update the session hash with the new session_token.
            login(@user)
            redirect_to cats_url
        else
            # Redirect the user to the cats index page.
            redirect_to new_sessions_url
        end
    end

    def destroy
      logout!
      redirect_to new_sessions_url
    end
end
