class FavoritesController < ApplicationController

  def create
    
    book = Book.find(params[:book_id])
    if book.user.id != current_user.id    # 自分の投稿にはいいねを出来ないようにする
      favorite = current_user.favorites.new(book_id: book.id)
      favorite.save
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    if book.user.id != current_user.id
      favorite = current_user.favorites.find_by(book_id: book.id)
      favorite.destroy
    end
    redirect_to request.referer   # 回答より抜粋こちらでも前の画面に戻れる
  end
end
