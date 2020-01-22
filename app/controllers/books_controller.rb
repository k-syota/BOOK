class BooksController < ApplicationController
  def top  	
  end

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.save
    render 'show'  
  end

  private
  def book_params
  params.require(:book).permit(:title, :body)   
  end 
end
