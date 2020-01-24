require 'rails_helper'

describe User do
  it "Should encrypt a password and allow for retreval of the same user" do
    user = User.new({:password => 'This_is_it!123', :email => 't@t.com', :admin => true})
    user.save
    test_user = User.authenticate('t@t.com', 'This_is_it!123')
    expect(user).to(eq(test_user))
  end
end