class Author < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :phone_number, length: { minimum: 10 }
end
