class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: ["Fiction", "Non-Finction"]}
  validate :clickbait

  def clickbait
    if !title.nil? && !title.include?("You Won't" || "Secret" || "Top" || "Guess")
       errors[:name] << 'Need a better title please!'
     end
   end

end
