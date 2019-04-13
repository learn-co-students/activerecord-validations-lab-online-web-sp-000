class MyValidator < ActiveModel::Validator

  def validate(record)
    unless record.title.include? "Won't Believe"
      record.errors[:title] << "Title must be clickbait-y"
    end
  end

end


# validates :title, inclusion: {in: %w('Won''t Believe' 'Secret' 'Top [number]' 'Guess')}
