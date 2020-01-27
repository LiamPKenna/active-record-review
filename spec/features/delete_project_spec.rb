require 'rails_helper'


describe "the deleting product process" do

  before(:each) do
    Capybara.current_driver = :selenium
    products = Product.all
    products.each { |prod| prod.destroy }
    @product1 = Product.new(
      :name => 'prod1',
      :cost => 5.50,
      :country_of_origin => 'USA'
    )
    @product1.save
    users = User.all
    users.each { |u| u.destroy }
    visit "/signup"
    fill_in 'user[email]', :with => 'test@test.com'
    fill_in 'user[password]', :with => 'test@test.com'
    fill_in 'user[password_confirmation]', :with => 'test@test.com'
    check 'user[admin]'
    click_on 'Sign Up'
  end
  
  it "allows admin users to delete products" do
    visit "/products"
    click_link 'Prod1'
    click_link 'Delete product'
    page.accept_confirm
    expect(page).to have_no_content "Prod1"
  end

end