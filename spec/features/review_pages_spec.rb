require 'rails_helper'


describe "the review creation and editing process" do

  before(:each) do
    users = User.all
    users.each { |u| u.destroy }
    visit "/signup"
    fill_in 'user[email]', :with => 'test@test.com'
    fill_in 'user[password]', :with => 'test@test.com'
    fill_in 'user[password_confirmation]', :with => 'test@test.com'
    check 'user[admin]'
    click_on 'Sign Up'
    products = Product.all
    products.each { |prod| prod.destroy }
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
    @review = Review.new(
      :author => 'test name', 
      :rating => 3, 
      :product_id => @product1.id,
      :content_body => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf')
    @review.save
    @review2 = Review.new(
      :author => 'test2 name', 
      :rating => 1, 
      :product_id => @product1.id,
      :content_body => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf')
    @review2.save
  end

  it "adds a new review" do
    visit "/products/#{@product1.id}/reviews/new"
    fill_in 'review[author]', :with => 'test'
    fill_in 'review[rating]', :with => 3
    fill_in 'review[content_body]', :with => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf'
    click_on 'Create Review'
    expect(page).to have_content 'Test successfully added a review!'
    expect(page).to have_content 'Test'
  end

  it "gives an error when no author is entered" do
    visit "/products/#{@product1.id}/reviews/new"
    fill_in 'review[rating]', :with => 3
    fill_in 'review[content_body]', :with => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf'
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end

  it "allows for editing of a review" do
    visit "/products"
    click_on 'Prod1'
    click_on 'Create new review'
    fill_in 'review[author]', :with => 'Goober'
    fill_in 'review[rating]', :with => 3
    fill_in 'review[content_body]', :with => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf'
    click_on 'Create Review'
    click_on 'Edit review'
    fill_in 'review[author]', :with => 'test2'
    click_on 'Update Review'
    expect(page).to have_content 'Test2 successfully updated their post!'
  end

  it "gives an error when no author is entered when editing" do
    visit "/products/#{@product1.id}/reviews/#{@review.id}"
    click_on 'Edit review'
    fill_in 'review[author]', :with => ''
    click_on 'Update Review'
    expect(page).to have_content "Author can't be blank"
  end
end