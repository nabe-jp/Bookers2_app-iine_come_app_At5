class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, :body, presence: true   # 空でない
  validates :body, length: { maximum: 200 }    # 最大200文字

  # いいね機能、idがFavoritesテーブル内に存在するかを調べる、存在すればtrue
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end