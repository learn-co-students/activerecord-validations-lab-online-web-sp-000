class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait?

    def clickbait?
        if title != nil && !title.include?("Won't Believe" || "Secret" || "Guess" || "Top" + "1" || "2" || "3" || "4" || "5" || "6" || "7" || "8" || "9" || "0")
            errors.add(:title, "must be clickbait")
        end
    end
end
