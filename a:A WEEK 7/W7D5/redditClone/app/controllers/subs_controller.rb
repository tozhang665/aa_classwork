class SubsController < ApplicationController

    before_action :require_logged_in, only: [:create, :new, :edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.create(sub_params)
        @sub.user_id = @current_user.id
        if @sub.save
            redirect_to subs_url
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub && @sub.user_id == @current_user.id
            @sub.update(sub_params)
            redirect_to sub_url(@sub.id)
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to sub_url(@sub.id)
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description, :user_id)
    end
end
