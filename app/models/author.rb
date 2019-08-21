class Author < ActiveRecord::Base
  validates :name, length: { minimum: 10}, uniqueness: true
end
