class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many :direct_messages
end
