class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }

  before_validation :filter_profanity_words
  after_destroy :send_destroy_info

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def tags=(text)
    text.is_a?(String) ? super(sanitize_tags(text)) : super(text)
  end

  private

  def sanitize_tags(text)
    text.split.map(&:downcase).uniq
  end

  def send_destroy_info
    ArticleMailer.article_destroy_info(self).deliver
  end

  def filter_profanity_words
    self.text = ProfanityFilter.new(self.text).censored_text
  end
end
