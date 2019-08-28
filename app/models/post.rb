class NonClickbait < ActiveModel::Validator
  def validate(record)
    if record.title
      bait_list = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      if !bait_list.any? {|bait| record.title.include? bait }
        record.errors[:name] << 'Need a name starting with X please!'
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validates_with NonClickbait
end
