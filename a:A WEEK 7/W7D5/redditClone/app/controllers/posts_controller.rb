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
        post_params[:sub_id].each do |sub_id|
          @post = Post.create(post_params)
          @post.sub_id = sub_id
          if @post.save
            ps = PostSub.create(post_id:@post.id,sub_id:sub_id)
            ps.save
          else

          end
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post && @post.user_id == current_user.id
            @post.update(post_params)
            redirect_to post_url(@post.id)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to post_url(@post.id)
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content, :user_id, sub_id:[])
    end

end
