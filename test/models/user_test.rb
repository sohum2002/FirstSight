# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :text
#  last_name              :text
#  about                  :text
#  birthday               :date
#  occupation             :text
#  field                  :text
#  orientation            :text
#  interest               :text
#  physical               :text
#  free_time              :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#  gender                 :string
#

require 'test_helper'

#user should be vaild
class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

#tests the presence (must be true)
 test "first name should be present" do
    @user.first_name = "     "
    assert_not @user.valid?
  end 

#tests the presence (must be true)
  test "last name should be present" do
    @user.last_name = "     "
    assert_not @user.valid?
  end 

#tests the presence (must be true)
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end 

#tests the length (must be true)
   test "first name should not be too long" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end

#tests the length (must be true)
  test "last name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end

#tests the email validation
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

#tests the email validation
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

#tests the email validation
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

end