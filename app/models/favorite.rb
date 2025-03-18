class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # 何度もいいねを出来ないようにuser_idとbook_idのペアが一意である（重複しない）状態に制限
  validates :user_id, uniqueness: {scope: :book_id}

end
