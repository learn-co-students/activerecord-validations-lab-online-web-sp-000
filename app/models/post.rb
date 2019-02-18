class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 12 }
  validates :content, length: { minimum: 20 }
  validates :summary, length: { maximum: 20 }
  validates :category, inclusion: { in: %w(Fiction) }
end
