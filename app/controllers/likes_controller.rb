class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.new(author: @user, post: @post)
    
    if @like.save
        flash[:success] = 'Liked'
        redirect_to user_post_path(@user, @post)
    else 
        flash[:danger] = 'Like could not be created.'
  end
end
