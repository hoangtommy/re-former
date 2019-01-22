require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(username: 'tommyhoang', email: 't@tommy.com', password: 'n0cowlevel')
  end

  test 'user object is valid' do
    assert @user.valid?
  end

  test 'username is not empty' do
    @user.username = ''
    assert_not @user.valid?, 'username should not be empty'
  end

  test 'username is no longer than 12 characters' do
    @user.username = 'a' * 13
    assert_not @user.valid?
  end

  test 'email is not empty' do
    @user.email = ''
    assert_not @user.valid?, 'email is an empty string'
  end

  test 'email is formatted properly' do
    invalid_emails = %w[tommyATgmail.com, tommy@gmail, @gmail.com, none@none.]
    invalid_emails.each do |bad_email|
      @user.email = bad_email
      assert_not @user.valid?, 'tommtATgmail.com should not work'
    end
  end

  test 'password is not empty' do
    @user.password = ''
    assert_not @user.valid?
  end

  test 'password is at least 6 characters' do
    @user.password = 'd' * 5
    assert_not @user.valid?
  end

  test 'password has at least 1 number, 1 uppercase' do
    invalid_passwords = %w[hell0there, Hellothere, !hellothere, 1hellothere]
    invalid_passwords.each do |password|
      @user.password = password
      assert_not @user.valid?
    end
  end
end
