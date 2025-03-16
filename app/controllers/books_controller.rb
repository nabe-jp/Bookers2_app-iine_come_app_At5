class BooksController < ApplicationController

  before_action :ensure_correct_user, only: [:edit]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.page(params[:page])
      render :index
    end
  end

  def show
    @book_show = Book.find(params[:id])
    @user = @book_show.user
    @book = Book.new
    @book_comment = BookComment.new
  end
  
  def index
    @user = current_user
    @books = Book.page(params[:page])
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
