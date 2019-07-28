class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :name_must_be_clickbaity, unless: Proc.new { |a| a.title.blank? }

    def name_must_be_clickbaity
        if ((!self.title.include?("Won't Believe")) && (!self.title.include?("Secret")) && (!self.title.include?("Guess")) && !(self.title =~ /^Top \d*/))
            errors.add(:title, "Title must be clickbaity")
        end
    end
end
