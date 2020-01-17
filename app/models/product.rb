class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}

  scope :newest, -> { order("created_at DESC").limit(3) }
end