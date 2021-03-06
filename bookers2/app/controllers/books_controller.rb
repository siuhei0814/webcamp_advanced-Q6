class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      user_id = current_user.id
      @user = User.find_by(id:user_id)
      @newbook = Book.new
      @books = Book.all
      render 'users/bookindex'
    end
  end

  def show
    @book = Book.find(params[:id])
    user_id = @book.user_id
    @user = User.find(user_id)
    @newbook = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to bookindex_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have editted book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to bookindex_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
