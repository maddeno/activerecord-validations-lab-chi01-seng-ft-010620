 
class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_must_be_clickbait

    def title_must_be_clickbait
        clickbait_words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title
        inspected_words = clickbait_words.any? do |word|
            self.title.include?(word)
        end
        if inspected_words == false
            errors.add(:title, "Must be clickbait")
        end
       end  
    end
    
    

end
