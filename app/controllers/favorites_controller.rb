class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_image_id])
    favorite = current_user.favorites.new(book_image_id: book.id)
    favorite.save
    redirect_to books_path(book)
  end

  def destroy
    book = Book.find(params[:book_image_id])
    favorite = current_user.favorites.find_by(book_image_id: book.id)
    favorite.destroy
    redirect_to books_path(book)
  end
end
