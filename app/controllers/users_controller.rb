class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @books = Book.all
  end

  def index
    @user = User.all
    @user = User.find(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
  	redirect_to user_path
  end
  end

  def destroy
    @user = User.find(params[:id])
       @book.destroy
       render 'books/top'
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_id, :profile_image_id, :introduction)
  	
  end

end
