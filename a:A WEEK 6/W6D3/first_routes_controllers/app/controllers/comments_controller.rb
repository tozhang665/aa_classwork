class CommentsController < ApplicationController

  def index
    if params[:user_id]
      @comments = Comment.find_by(user_id: params[:user_id])
    elsif params[:artwork_id]
      @comments = Comment.find_by(artwork_id: params[:artwork_id])
    elsif params[:user_id].nil? && params[:artwork_id].nil?
      @comments = Comment.all
    end

    if @comments
      render json: @comments
    else
      render json: {error: "Doesn't exist"}, status: 418
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    if @comment
      @comment.destroy
      render json: @comment
    else
      render json: {error: "No comment exists to destroy"}, status: 418
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end
