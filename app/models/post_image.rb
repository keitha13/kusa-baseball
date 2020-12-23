class PostImage < ApplicationRecord
  belongs_to :post
  attachment :post_image
end
