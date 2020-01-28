class BooksController < ApplicationController
    before_action :authenticate_user!, only: [:index,:show,:create,:edit,:update,:destroy]


  def top
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = @book.user
  end

  def edit
        @book = Book.find(params[:id])
        @user = User.find(current_user.id)
        @books = Book.all
    if  @book.user_id == current_user.id
    else
      redirect_to books_path
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = User.find(current_user.id)
    @books = Book.all
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render 'index'
    end
  end


  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path
    else
        render 'edit'
    end
  end

  def destroy
  @book = Book.find(params[:id])
    if @book.destroy
       redirect_to books_path
    else
      @book = Book.all
      render 'index'
    end
  end

  private

  def book_params
  params.require(:book).permit(:title, :body, :user_id)
  end


end