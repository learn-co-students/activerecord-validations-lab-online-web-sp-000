class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait

    def is_clickbait
        if self.title &&!(self.title.include?("Won't Believe")||self.title.include?("Secret")||self.title.include?("Top")||self.title.include?("Guess"))
          errors.add(:title, "is not clickbaity")
        end
    end

end
