class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?, on: :create
  
  def is_clickbait?
    if title
      errors.add(:title, "is not clickbait") unless title.match? /Won't Believe|Secret|Top [0-9]+|Guess/
    end
  end
end
