require 'rails_helper'


# describe "the add a product process" do
#   it "adds a new productn" do
#     visit products_path
#     click_link 'Create a New Product'
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