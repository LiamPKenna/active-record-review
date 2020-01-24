require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :content_body }
  it { should validate_length_of(:content_body).is_at_least(50) }
  it { should validate_length_of(:content_body).is_at_most(250) }
  it { should validate_numericality_of(:rating).is_greater_than(0) }
  it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
  it 'should titleize an entered author name' do
    product = Product.new(
      :name => 'prod',
      :cost => 5.50,
      :country_of_origin => 'USA'
    )
    product.save
    review = Review.new(
      :author => 'test name', 
      :rating => 3, 
      :product_id => product.id,
      :content_body => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf')
    review.save
    expect(Review.find(review.id).author).to(eq("Test Name"))
  end
end