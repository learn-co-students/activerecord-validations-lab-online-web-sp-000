class ClickbaityValidator < ActiveModel::Validator
  TITLES = [/Won't Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]
  def validate(record)
    if record.title
      if TITLES.none? { |title| title.match(record.title) }
        record.errors.add(:title, "Title must be clickbait!")
      end
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  
  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 250}
  validates :summary, presence: true, length: {maximum: 250}
  validates :category, presence: true, inclusion: {in: %w(Fiction Non-Fiction)}
  validates_with ClickbaityValidator
end
