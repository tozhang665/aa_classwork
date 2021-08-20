class PostsController < ApplicationController

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.create(post_params)
        @post.user_id = current_user.id
        
        if @post.save
            redirect_to post_url(@post.id)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content, :user_id, :sub_id)
    end

end
