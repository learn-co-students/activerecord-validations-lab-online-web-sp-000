class Post < ActiveRecord::Base
    
    belongs_to :author
    validates :title, presence: true   
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid size" }

    validate :clickbait?

    def clickbait?
      if self.title && !self.title.match(/Won't Believe|Secret|Top [\d*]|Guess/)
        errors.add(:clickbait, "is not enticing enough")
      end
    end

    #does not work
    # validate :must_contain
    # def must_contain        
    #     if (self.title) && (self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top[number]") || self.title.include?("Guess"))         
    #    end

    # end 



    

end


