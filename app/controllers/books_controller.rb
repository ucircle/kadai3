class BooksController < ApplicationController

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
    @book = Book.new
  end

  def create

    @new_book = Book.new
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have crated book successfully."
    redirect_to book_path(@book.id)
    else
    render :index
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(book.id)
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
end
