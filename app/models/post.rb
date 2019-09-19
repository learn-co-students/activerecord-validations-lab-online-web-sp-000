class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}


  validates_with MyValidator
end

class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.includes?(%w("Won't Believe" "Secret" "Top [number]"  "Guess"))
      record.errors[:name] << 'Not a good title!'
    end
  end
end
