class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = user.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path
    else
      @user = User.(params[:id])
      render edit_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :introduction)
  end


end
