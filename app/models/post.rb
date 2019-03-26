class Post < ActiveRecord::Base

  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :title, presence: true
  validates :category, inclusion: { in: %w(Fiction Non-fiction) }
  validate :clickbait



end

def clickbait

   click_words = (/Won't Believe|Secret|Top [\d*]|Guess/)


   if self.title && !self.title.match(click_words)
       errors.add(:title, "Must be clickbate-y.")
   end
 end
