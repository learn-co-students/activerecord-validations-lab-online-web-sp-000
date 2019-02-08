class MyValidator < ActiveModel::Validator
  def validate(post)
    key_words = ["Won't Believe", "Secret", "Top " "Guess"]
    key_words.each do |word|
      if post.title && post.title.include?(word)
        return
      end
    end
    post.errors[:title] << 'Need clickbait!'
  end
end