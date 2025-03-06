class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      # @user = User.new
      render "users/show"
    end
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def index
    @books = Book.page(params[:page])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      if @book.title.empty? && @book.body.empty?
        flash.now[:alert] = "・Title can't be blank<br>・Body can't be blank"
      else
        if @book.title.empty?
          flash.now[:alert] = "・Title can't be blank"
        else
          flash.now[:alert] = "・Body can't be blank"
        end
      end
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
