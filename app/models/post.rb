require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: {maximum: 250}
  validates :content, length: {minimum: 250}
  #validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

  validate :is_click_baity?

  def is_click_baity?
    is_click_baity =
    title.present? &&
    (
      title.include?("Won't Believe") ||
      title.include?("Secret") ||
      title.include?("Top") ||
      title.include?("Guess")
    )
    if !is_click_baity
      errors.add(:title, "not clickbait-y")
    end
  end
end
