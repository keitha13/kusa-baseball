class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :post_image

  validates :body, length: { in: 1..140 }
  with_options numericality: { only_integer: true }, allow_blank: true do
    validates :AB
    validates :single
    validates :double
    validates :triple
    validates :HR
    validates :RBI
    validates :run
    validates :BB_HBP
    validates :steal
    validates :inning
    validates :hit_allowed
    validates :run_allowed
    validates :SO
    validates :BB_HBP_allowed
    validates :score_my_team
    validates :score_team_against
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum win_lose: { win: 0, draw: 1, lose: 2 }

  def Post.search(search, search_option)
    if search_option == "2"
      Post.where(['body LIKE ?', "%#{search}%"])
    end
  end

end
