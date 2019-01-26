class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :custom_validate

  def custom_validate
    array = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title == nil
    else
      is_clickbait = array.any? do |phrase|
        self.title.include? phrase
      end
      if !is_clickbait
        errors.add(:title, "does not include click-bait")
      end
    end

  end
end
