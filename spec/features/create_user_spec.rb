require 'rails_helper'


describe "the add a user process" do

  before(:all) do
    @product1 = Product.new(
      :name => 'prod1',
      :cost => 5.50,
      :country_of_origin => 'USA'
    )
    @product1.save
  end

  before(:each) do
    users = User.all
    users.each { |u| u.destroy }
  end

  it "allows a user to create a new account" do
    visit "/signup"
    fill_in 'user[email]', :with => 'test@test.com'
    fill_in 'user[password]', :with => 'test@test.com'
    fill_in 'user[password_confirmation]', :with => 'test@test.com'
    check 'user[admin]'
    click_on 'Sign Up'
    expect(page).to have_content "test@test.com"
  end

  it "requires a user to complete all fields" do
    visit "/signup"
    fill_in 'user[password]', :with => 'test@test.com'
    fill_in 'user[password_confirmation]', :with => 'test@test.com'
    check 'user[admin]'
    click_on 'Sign Up'
    expect(page).to have_content "There was a problem signing up."
  end

end