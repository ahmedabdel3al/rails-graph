class Post < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :rating, presence: true

  scope :with_comments, -> { includes(:comments) }
  scope :ordered, -> { order(created_at: :desc) }

end
