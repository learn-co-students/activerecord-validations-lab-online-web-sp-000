class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :non_clickbait

    def non_clickbait
        #binding.pry
        if title.nil? || !["Won't Believe","Secret", "Top", "Guess"].any? { |bait_title| title.include?(bait_title) }
            errors.add(:title, "must be click baity")
        end
    end
end
