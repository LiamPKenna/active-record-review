class Review < ApplicationRecord
  belongs_to :product

  before_save(:titleize_author)

  private
  def titleize_author
    self.author = self.author.split(' ').map { |w|
      (w[0] =~ /[a-z]/i) ? (w[0].upcase + w.slice(1, w.length)) : w
    }.join(' ')
  end
end