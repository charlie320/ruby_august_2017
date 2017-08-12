require 'rails_helper'

RSpec.describe User, type: :model do
  # Model Tests
  # User
  # Username field: must be required, must be unique, must be longer than 5 characters
  context "With valid signin" do
    it "should save" do
      # user = User.new(
      #   username: 'johndoe'
      # )
      # expect(user).to be_valid
      expect(build(:user)).to be_valid
    end
  end

  context "With invalid signin"do
    it "should not save if username already exists" do
      create(:user)
      expect(build(:user)).to be_invalid
    end

    it "should not save if username is blank" do
      expect(build(:user, username: "")).to be_invalid
    end
  end

end

# Feature Tests
# Register User
# If created sucessfully
# Current path should equal messages_path (messages#index)
# Current page should contain "Welcome #{testusername}"
# If not created succesfully
# Current path should equal newuserpath (users#new)
# Current page should contain error messages (create test for each error)
# Create Message
# If created succesfully
# Current path should equal messages_path (messages#index)
# Current page should contain message you just created
# If not created succesfully
# Current path should equal messages_path (messages#index)
# Current page should contain error messages (create test for each error except user reference required).
# Log Out
# messages_path (messages#index) page should contain Log Out button
# Current path should equal newuserpath (users#new) after clicking log out button
