class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  private

    CLICKBAIT_PHRASES = ["Won't Believe", "Secret", "Top", "Guess"]

    def clickbait
      if title
        if CLICKBAIT_PHRASES.none?{|phrase| title.include?(phrase)}
          errors.add(:title, "Must contain clickbait")
        end
      end
    end

end
