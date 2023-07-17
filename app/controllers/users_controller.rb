class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books
    @new_book = Book.new
  end
  


  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user.id_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
