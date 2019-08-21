class Post < ActiveRecord::Base
  validates :post
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w( fiction non-fiction )}
end
