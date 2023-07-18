class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @new_book = Book.new
    @user = current_user
  end

  def edit
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to books_path
    else
    render :new
    end
  end



  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
