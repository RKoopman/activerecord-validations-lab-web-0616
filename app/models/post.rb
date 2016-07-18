
class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait_title



  def clickbait_title
    clickbaits = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title
      if clickbaits.none? { |click| self.title.include?(click) }
        errors.add(:title, "Sorry, title is no bueno!")
      end
    end
  end
end