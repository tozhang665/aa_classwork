class SessionsController < ApplicationController

  before_action :require_logged_in , only:[:destroy]
  before_action :require_logged_out, only:[:new,:create]
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credential(params[:user][:username],params[:user][:password])
    if @user
      login(@user)
      redirect_to users_url
    else
      render :new
    end
  end

  def destroy
    if logged_in?
      logout!
      redirect_to new_session_url
    end

  end

end
