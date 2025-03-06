class Book < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true   # 空でない
  validates :body, length: { maximum: 200 }    # 最大200文字
end