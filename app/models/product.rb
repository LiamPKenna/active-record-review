class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :cost, :country_of_origin, presence: true

  before_save(:titleize_name)

  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}

  scope :newest, -> { order("created_at DESC").limit(3) }

  scope :from_origin, -> (origin_parameter) do
    where("country_of_origin ilike ?", "#{origin_parameter}") 
  end

  scope :by_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
  )}

  scope :by_low_price, -> { order("cost ASC") }

  scope :by_high_price, -> { order("cost DESC") }

  scope :by_name_a, -> { order("name ASC") }

  scope :by_name_z, -> { order("name DESC") }

  def average_rating
    if self.reviews.length > 0
      rating_sum = self.reviews.map { |r| r.rating }.reduce(:+)
      rating_sum/self.reviews.length.round
    else
      0
    end
  end

  private
  def titleize_name
    self.name = self.name.split(' ').map { |w|
      (w[0] =~ /[a-z]/i) ? (w[0].upcase + w.slice(1, w.length)) : w
    }.join(' ')
  end
end