require 'rails_helper'


describe "the sesion create and destroy process" do

  before(:each) do
    users = User.all
    users.each { |u| u.destroy }
    @user1 = User.new(
      :email => 'test@test.com',
      :password => 'test@test.com',
      :password_confirmation => 'test@test.com',
      :admin => true
    )
    @user2 = User.new(
      :email => 'test2@test.com',
      :password => 'test2@test.com',
      :password_confirmation => 'test2@test.com',
      :admin => false
    )
    @user1.save
    @user2.save
    @product1 = Product.new(
      :name => 'prod1',
      :cost => 5.50,
      :country_of_origin => 'USA'
    )
    @product1.save
    @review = Review.new(
      :author => 'test name', 
      :rating => 3, 
      :product_id => @product1.id,
      :content_body => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf')
    @review.save
  end

  it "allows a user to sign in" do
    visit "/signin"
    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'test@test.com'
    click_on 'Sign In'
    expect(page).to have_content "test@test.com"
  end

  it "gives an error when user tries to sign in with incorect credentials" do
    visit "/signin"
    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'test@ttttest.com'
    click_on 'Sign In'
    expect(page).to have_content "There was a problem signing in. Please try again."
  end

  it "allows a user to sign out" do
    visit "/signin"
    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => 'test@test.com'
    click_on 'Sign In'
    click_on 'sign-out'
    expect(page).to have_content "sign-in"
  end

  it "requires users to log in in order to post reviews" do
    visit "/products/#{@product1.id}/reviews/new"
    expect(page).to have_content "Sorry, you aren't authorized to visit that page."
  end

  it "requires users to log in in as admin to edit products" do
    visit "/signin"
    fill_in 'email', :with => 'test2@test.com'
    fill_in 'password', :with => 'test2@test.com'
    click_on 'Sign In'
    visit "/products/#{@product1.id}/edit"
    expect(page).to have_content "Sorry, you aren't authorized to visit that page."
  end

end