class UsersController < ApplicationController

  def userindex
    @user_id = current_user.id
    @user = User.find(@user_id)
    @newbook = Book.new
    @users = User.all
  end

  def bookindex
    @book = Book.new
    user_id = current_user.id
    @user = User.find_by(id:user_id)
    @newbook = Book.new
    @books = Book.all
  end

  def about
  end

  def usershow
    @user = User.find(params[:id])
    @user_id = @user.id
    @books = Book.where(user_id:@user_id)
    @newbook = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to usershow_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have editted user info successfully."
      redirect_to usershow_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
