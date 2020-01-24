require 'rails_helper'


# describe "the add a product process" do

#   before(:all) do
#     @product1 = Product.new(
#       :name => 'prod1',
#       :cost => 5.50,
#       :country_of_origin => 'USA'
#     )
#     @product1.save
#     @product2 = Product.new(
#       :name => 'prod2',
#       :cost => 5.80,
#       :country_of_origin => 'Canada'
#     )
#     @product2.save
#     review = Review.new(
#       :author => 'test name', 
#       :rating => 3, 
#       :product_id => @product1.id,
#       :content_body => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf')
#     review.save
#     review2 = Review.new(
#       :author => 'test name', 
#       :rating => 1, 
#       :product_id => @product1.id,
#       :content_body => 'asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf')
#     review2.save
#   end

#   before(:each) do
#     visit "/signup"
#     fill_in 'user[email]', :with => 'test@test.com'
#     fill_in 'user[password]', :with => 'test@test.com'
#     fill_in 'user[password_confirmation]', :with => 'test@test.com'
#     check 'user[admin]'
#     click_on 'Sign Up'
#   end

#   it "adds a new product" do
#     visit '/products/new'
#     fill_in 'product[name]', :with => 'test'
#     fill_in 'product[cost]', :with => 3
#     fill_in 'product[country_of_origin]', :with => 'USA'
#     click_on 'Create Product'
#     expect(page).to have_content 'Test successfully added!'
#     expect(page).to have_content 'Test'
#   end

#   it "gives an error when no name is entered" do
#     visit new_product_path
#     fill_in 'product[cost]', :with => 3
#     fill_in 'product[country_of_origin]', :with => 'USA'
#     click_on 'Create Product'
#     expect(page).to have_content "Name can't be blank"
#   end
# end