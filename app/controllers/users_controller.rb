class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
    @user = User.new

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
end
