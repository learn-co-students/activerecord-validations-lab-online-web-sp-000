class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length:{minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-fiction)}
    validate :click_baity


    Click_bait = [/Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i]

    def click_baity
        if Click_bait.none? {|p| p.match title}
            errors.add(:title, "Not Click-Bait")
        end
    end
end
