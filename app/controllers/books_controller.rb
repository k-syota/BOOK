
class BooksController < ApplicationController
  before_action :authenticate_user!

  def top   
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
         render 'edit'
    end
  end

  def create
    @book = Book.new(book_params)
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @book = Book.all
      render 'index'
    end
  end

  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  render 'index'    
  end

  private
  
  def book_params
  params.require(:book).permit(:title, :body, :user_id) 
  end


end