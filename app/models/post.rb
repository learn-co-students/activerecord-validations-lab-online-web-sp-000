class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, :presence => true, :inclusion => { :in => ["Fiction", "Non-Fiction"] }
  validates :title, :exclusion => { :in => ["Won't Believe", "Secret", "Top [number]","Guess"] }
