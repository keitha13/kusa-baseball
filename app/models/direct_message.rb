class DirectMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :entry

  validates :content, length: { in: 1..1000 }
  after_create_commit { DirectMessageBroadcastJob.perform_later self }
end
