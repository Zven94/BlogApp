class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user_id = session[:user_id]

    return unless @like.save

    redirect_to user_post_path(@like.post.user, @like.post) # Utiliza rutas generadas por Rails
  end

  def destroy
    @like = Like.find(params[:id])
    post = @like.post
    user = post.author

    return unless @like.destroy

    redirect_to user_post_path(user, post)
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
