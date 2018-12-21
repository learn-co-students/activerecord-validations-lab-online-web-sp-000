class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :is_click_bait
  
  def is_click_bait
    baits = ["Won't Believe", "Secret", "Top" "Guess"]
    errors.add(:title, "isn't click bait!") unless title && baits.any? { |w| title.include?(w) }
  end
end
