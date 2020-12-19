class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :post_image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum win_lose: { win: 0, draw: 1, lose: 2 }
end
