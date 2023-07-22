class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def index
    @books = Book.all
    @new_book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @new_book = Book.new
  end

  def create

    @books = Book.all
    @user = current_user
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
    flash[:notice] = "You have crated book successfully."
    redirect_to book_path(@new_book.id)
    else
    render :index
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end




  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
