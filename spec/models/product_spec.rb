require 'rails_helper'

describe Product do

  before(:all) do
    @product1 = Product.new(
      :name => 'prod1',
      :cost => 5.50,
      :country_of_origin => 'USA'
    )
    @product1.save
    @product2 = Product.new(
      :name => 'prod2',
      :cost => 5.80,
      :country_of_origin => 'Canada'
    )
    @product2.save
    review = Review.new(
      :author => 'test name', 
      :rating => 3, 
      :product_id => @product1.id,
      :content_body => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf')
    review.save
    review2 = Review.new(
      :author => 'test name', 
      :rating => 1, 
      :product_id => @product1.id,
      :content_body => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf')
    review2.save
  end

  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  it "should return the average rating for a product" do
    expect(@product1.average_rating).to(eq(2))
    expect(@product2.average_rating).to(eq(0))
  end
  it "should return the product with the most reviews" do
    expect(Product.most_reviews.first.name).to(eq('Prod1'))
  end
  it "should return products by origin" do
    expect(Product.from_origin('USA').first.name).to(eq('Prod1'))
  end
  it "should return an array of all products ordered by review number" do
    expect(Product.by_reviews.first.name).to(eq('Prod1'))
  end

end