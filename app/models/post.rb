class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbaity?

  CLICKBAIT_PATTERNS = [/won't believe/i, /top \d*/i, /secret/i, /guess/]
  
  def clickbaity?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait-y")
    end
  end
end
