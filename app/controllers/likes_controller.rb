class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    @like.user_id = session[:user_id]
    @like.save
    redirect_to post_path(@like.post)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to post_path(@like.post)
  end
end
