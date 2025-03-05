class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, :body, presence: true   # 空でない
  validates :body, length: { maximum: 200 }    # 最大200文字

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end