class CommentsController < ApplicationController

  before_filter :authenticate_user!, :only =>[:create]

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id:  current_user.id)
  end

end
