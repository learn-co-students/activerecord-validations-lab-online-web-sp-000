class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
  validate :must_contain_clickbait_titles

  def must_contain_clickbait_titles
    clickbait = ['Won\'t Believe', 'Secret', 'Top', 'Guess']
    
    if title && !(title.include?(clickbait[0]) || title.include?(clickbait[1]) || title.include?(clickbait[2]) || title.include?(clickbait[3]))
      errors.add(:title, "false")
    end
  end
end
