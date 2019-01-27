class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_baity_title

  def click_baity_title
    if title.present? && !!["Won't Believe", "Secret", "Top 10", "Guess"].select {|ele| title.include?(ele)}.empty?
      errors.add(:click_baity_title, "Not a click baity tittle")
    end

  end
end
