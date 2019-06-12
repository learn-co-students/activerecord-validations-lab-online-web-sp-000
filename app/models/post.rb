class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: ["Fiction","Non-Fiction"]}
  validates_each :title do |record, attribute, title|
    if title.nil?
      record.errors.add(attribute, "Can't be empty")
    elsif !title.include?("Won't Believe") && !title.include?("Secret") &&  !title.include?("Top [number]") && !title.include?("Guess")
      record.errors.add(attribute, 'Not what we wanted')
    end
  end
end
