class ProfilesController < ApplicationController

  def index
    @profiles = User.all
  end

  def show
    @profile = User.find(params[:id])
    @posts = Post.where(user_id: @profile.id).order("created_at DESC")
  end

end
