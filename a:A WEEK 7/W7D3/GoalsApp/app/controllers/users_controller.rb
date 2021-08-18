class UsersController < ApplicationController
    def new
        @user= User.new
        render :new
    end

    def create
        @user= User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            redirect_to users_url
        end
    end

    def index
        @users= User.all
        render :index
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
