class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 150 }
  validates :summary, length: { maximum: 150 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait


  def clickbait
    if !title.nil? && (!title.include?("You Won't" || "Amazing" || "Best" || "Greatest"))
      errors.add(:clickbait, "Not a clickbait worthy title. Try again.")
    end
  end

end
