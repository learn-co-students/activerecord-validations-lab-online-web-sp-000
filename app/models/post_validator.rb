class PostValidator < ActiveModel::Validator
    def validate(post)
        taglines = ["Won't Believe", "Secret", "Top [number]",]

        if post.title
            taglines.each do |tagline|
                if post.title.include? tagline
                    return
                else
                    post.errors[:title] << "Not Clickbait"
                end
            end
        end
    end  
end
   
  