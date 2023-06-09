class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)

    respond_to do |format|
      format.html
      format.xml { render xml: @posts }
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:comments).find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render xml: @post.comments }
      format.json { render json: @post.comments }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.author = current_user

    if @post.save
      flash[:success] = 'Post created successfully.'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash[:danger] = 'Post could not be created.'
      render :new
    end
  end

  load_and_authorize_resource

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post

    puts 'Authorization successful'

    if @post.destroy
      flash[:success] = 'Post deleted successfully.'
    else
      flash[:danger] = 'Post could not be deleted.'
    end

    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
