class Post < ApplicationRecord
  belongs_to :user

  attachment :post_image, destroy: false
end
