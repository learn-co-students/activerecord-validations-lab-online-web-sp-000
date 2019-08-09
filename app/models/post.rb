class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w( Fiction Non-Fiction )}

  private

  def clickbait?
    puts "in the validation"
    if (!self.title.nil?) && (self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top [number]") || self.title.include?("Guess"))
      true
    else
      errors.add(:message, "Not Click-Baity enough")
    end
  end

end
