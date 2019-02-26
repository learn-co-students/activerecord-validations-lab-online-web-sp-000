class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

end

  def clickbait

    key_words = (/Won't Believe|Secret|Top [\d*]|Guess/)

    if self.title && !self.title.match(key_words)
        errors.add(:title, "is not clickbate-y enough.")
    end
  end
