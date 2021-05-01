class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
    @book = Book.new(book_params)

    return redirect_to action: :new unless @book.save
      
    redirect_to book_path(@book)
  end
  
end
