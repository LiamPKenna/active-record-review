class Review < ApplicationRecord
  belongs_to :product
  validates :author, :rating, :content_body, presence: true
  validates_length_of :content_body, maximum: 250, minimum: 50
  validates :rating, :numericality => { greater_than: 0, less_than_or_equal_to: 5 }

  before_save(:titleize_author)

  private
  def titleize_author
    self.author = self.author.split(' ').map { |w|
      (w[0] =~ /[a-z]/i) ? (w[0].upcase + w.slice(1, w.length)) : w
    }.join(' ')
  end
end