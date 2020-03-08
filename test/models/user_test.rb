require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "example", email: "example@example.com", password: "foobar")
  end
  
  test "Should have a name" do
    @user.username = ' '
    assert_not @user.valid? 
  end

  test "Should have a non empty email" do
    @user.email = ' '
    assert_not @user.valid?
  end

  test "Should have a valid email" do
    @user.email = "ExaMplE@ExAmPlE..co.in"
    assert_not @user.valid?
  end

  test "Length of email should be a maximum of 255" do
    @user.email = "A" * 255 +"@example.com"
    assert_not @user.valid?
  end

  test "Password should be non-empty" do
    @user.password = ' '
    assert_not @user.valid?
  end
  
end
