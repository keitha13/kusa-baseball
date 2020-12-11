class Post < ApplicationRecord
  belongs_to :user
  attachment :post_image, destroy: false
  has_many :post_comments, dependent: :destroy
end
