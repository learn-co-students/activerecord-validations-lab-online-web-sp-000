class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbaits
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  private

  def clickbaits
    if title
      titler = title.split(" ")
      clickers = %w(Believe Secret Top Guess)
      if (titler & clickers).empty?
        errors.add(:title, "needs more clickbait")
      end
    end
  end

end
