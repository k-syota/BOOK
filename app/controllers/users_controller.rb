class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path
  end

  def destroy
    @book = Book.find(params[:id])
       @book.destroy
       render 'books/top'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  	
  end

end
