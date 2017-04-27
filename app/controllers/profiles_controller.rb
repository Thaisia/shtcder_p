class ProfilesController < ApplicationController

  def index
    @profiles = User.all
  end

  def show

    @profile = User.find(params[:id])
    @posts = Post.where(user_id: @profile.id).order("created_at DESC")
    @posts = @posts.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
