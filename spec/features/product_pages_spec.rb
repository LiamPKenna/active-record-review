require 'rails_helper'


describe "the add a product process" do

  before(:all) do
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

  before(:each) do
    users = User.all
    users.each { |u| u.destroy }
    visit "/signup"
    fill_in 'user[email]', :with => 'test@test.com'
    fill_in 'user[password]', :with => 'test@test.com'
    fill_in 'user[password_confirmation]', :with => 'test@test.com'
    check 'user[admin]'
    click_on 'Sign Up'
  end

  it "adds a new product" do
    visit '/products/new'
    fill_in 'product[name]', :with => 'test'
    fill_in 'product[cost]', :with => 3
    fill_in 'product[country_of_origin]', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Test successfully added!'
    expect(page).to have_content 'Test'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    fill_in 'product[cost]', :with => 3
    fill_in 'product[country_of_origin]', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end

  it "allows for editing of a product" do
    visit "/products/#{@product2.id}"
    click_on 'Edit product'
    fill_in 'product[name]', :with => 'test2'
    click_on 'Update Product'
    expect(page).to have_content 'Test2 successfully updated!'
  end

  it "gives an error when no name is entered when editing" do
    visit "/products/#{@product2.id}"
    click_on 'Edit product'
    fill_in 'product[name]', :with => ''
    click_on 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end

  it "allows admin users to delete products" do
    visit "/products/#{@product2.id}"
    click_on 'Delete product'
    page.accept_alert
    expect(page).to not_have_content 'Test2'
  end

end