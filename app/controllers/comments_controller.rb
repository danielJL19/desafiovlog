class CommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_post
  def create
    @comment = @post.comments.create(comments_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: "se ha creado"
    else
      redirect_to post_path(@post), alert: "error al crearlo"
    end
  end

  def destroy
  end

  private 
  def find_post 
    @post =Post.find(params[:post_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end
end
