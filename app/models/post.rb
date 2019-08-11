class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :cannot_be_clickbait


  def cannot_be_clickbait
    if self.title == "True Facts"
      errors.add(:click_bait, "can't be click_bait")
    end
  end

end
