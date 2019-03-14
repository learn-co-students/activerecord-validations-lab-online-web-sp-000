class Post < ActiveRecord::Base
  CLICKBAIT = [/Won't Believe/, /Secret/, /Top [\d]+/, /Guess/]

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :check_clickbait

  def check_clickbait
    is_clickbait = CLICKBAIT.select do |rx|
      rx.match(title)
    end.any?

    if !is_clickbait
      errors.add :title, "Must be clickbait"
    end
  end
end