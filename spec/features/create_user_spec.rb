require 'rails_helper'


describe "the add a product process" do

  before(:each) do
    
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

end