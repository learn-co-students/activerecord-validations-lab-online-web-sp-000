#class ClickBaitValidator < ActiveModel::Validator
#  def validate(record)
#    if (!record.title.nil?) && (record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top [number]") || record.title.include?("Guess"))
#      true
#    end
#    false
#  end
#end