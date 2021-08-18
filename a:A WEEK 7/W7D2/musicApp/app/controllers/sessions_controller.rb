class SessionsController < ApplicationController
  
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:destroy]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],params[:user][:password])

    if @user
      login(@user)
      redirect_to users_url
    else
      render json: params
    end
  end

  def destroy
    logout!
    redirect_to new_sessions_url
  end
end
