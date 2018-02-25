class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :body, presence: true, allow_blank: false
end
