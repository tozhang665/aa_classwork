class UsersController < ApplicationController
  def index
    if params[:username]
      @users = User.find_by(username: params[:username])
    else
      @users = User.all
    end

    if @users
      render json: @users
    else
      render json: {error: "User doesn't exist"}, status: 418
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: {error: "No user with that ID"}, status: 418
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user 
      user.update(user_params)
      redirect_to user_url(user)
    else
      render json:{error: "user with ID given does not exist"}, status: 418
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      # redirect_to users_url <--- WRONG WAY TO DO IT
      render json: user
    else
      render json: {error: "No user to delete there"}, status: 418
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end

# finished users_controller