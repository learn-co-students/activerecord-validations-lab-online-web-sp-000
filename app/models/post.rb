class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
    ]

    private

    # def valid_title
    #     # binding.pry
    #     if self.title.present? && !self.title.include?("Won't Believe") && !self.title.include?("Secret") && !self.title.include?("Top") && !self.title.include?("Guess")
    #     # if self.title.present? && !self.title.include?%w("Won't Believe" "Secret" "Top" "Guess")
    #     #  binding.pry
    #         errors.add(:title, "Invalid Title")            
    #     end

    def is_clickbait?
        if CLICKBAIT_PATTERNS.none? {|pat| pat.match title }
            errors.add(:title, "Must be clickbait")
        end
    end



end
