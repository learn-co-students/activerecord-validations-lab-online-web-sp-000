class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 30 }
  validates :summary, length: { maximum: 30 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction) }
  validates :title, format: { with: /You Won't Believe/ }
end
