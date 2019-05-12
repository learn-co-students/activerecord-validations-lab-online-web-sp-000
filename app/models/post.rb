class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w( Fiction Non-Fiction ),
    :message => "%{value} is not a valid category" }
  validate :click_baity

  def click_baity
    errors.add(:title, "is not adequately click_baity") unless self.title &&
      (self.title.include?("Won't Believe") ||
      self.title.include?("Secret") ||
      self.title.include?("Top ") ||
      self.title.include?("Guess"))
  end
end
