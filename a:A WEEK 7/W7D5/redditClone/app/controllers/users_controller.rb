class UsersController < ApplicationController

  def new
    @user =User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save
       login(@user)
       redirect_to users_url 
    else
      render :new
    end
  end

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username,:password)
  end


end
