
class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value == nil || !value.match?(/Won't Believe|Secret|Top|Guess/)
      record.errors[attribute] << (options[:message] || "is not clickbait-y")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, title: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 30 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction) }
end
