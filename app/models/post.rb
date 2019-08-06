class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :click_baity?

    def click_baity?
        if !!self.title && !self.title.match(/(won't believe) | (secret) | (guess) | (top \d)/i)
            errors.add(:title, "Title must be click-bait")
        end
    end
end
