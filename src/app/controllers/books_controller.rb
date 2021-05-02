class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)
    @book = Book.new(book_params)

    unless @book.save
      flash[:danger] = "登録に失敗しました。"
      return redirect_to action: :new 
    end
    flash[:success] = "家計簿に１件登録しました。"
    redirect_to book_path(@book)
  end

  def edit
  end

  def update
    book_params = params.require(:book).permit(:year, :month, :inout, :category, :amount)

    unless @book.update(book_params)
      flash[:danger] = "更新に失敗しました。"
      return redirect_to action: :edit
    end
      
    flash[:success] = "更新に成功しました。"
    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy

    flash[:success] = "削除に成功しました。"
    redirect_to books_path # action: :index も同じ
  end
  

  def set_book
    @book = Book.find(params[:id])
  end

end
