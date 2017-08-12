require 'rails_helper'
# Feature Tests
feature "signing in" do
# Register User
# If created sucessfully
# Current path should equal messages_path (messages#index)
# Current page should contain "Welcome #{testusername}"
  scenario "successfully signs in as user" do
    create(:user)
    visit root_path
    fill_in "username", with: "johndoe"
    click_button "Sign In"
    expect(page).to have_content("Welcome#{User.first.username}")
    expect(current_path).to eq(messages_path)
  end

  # If not created succesfully
  # Current path should equal newuserpath (users#new)
  # Current page should contain error messages (create test for each error)
  scenario "unsuccessfully signs in as user" do
    visit "users#new"
    fill_in "username", with: "no one"
    click_button "Sign In"
    expect(page).to have_content("Could not find username")
    expect(current_path).to eq(root_path)
  end
end

# After sign in
feature "after sign in" do
  before(:each) do
    create(:user)
    visit root_path
    fill_in "username", with: "johndoe"
    click_button "Sign In"
  end

    scenario "there should be a logout feature" do
    # Log Out
    # messages_path (messages#index) page should contain Log Out button
    # Current path should equal newuserpath (users#new) after clicking log out button
      expect(page).to have_link("Log Out")
      clink_link("Log Out")
      expect(current_path).to eq(new_user_path)
    end

    scenario "there should be a form to create a message" do
      expect(page).to have_field("message")
      expect(page).to have_button("Post a Message")
    end
  end

# Create Message
feature "creating a message" do
  before(:each) do
    @user = create(:user)
    visit root_path
    fill_in "username", with: "johndoe"
    click_button "Sign In"
  end

  scenario "successfully creating a message" do
    # If created succesfully
    # Current path should equal messages_path (messages#index)
    # Current page should contain message you just created
    fill_in "message", with: "This is a test message.  If this had been an actual message then ..."
    click_button "Post a Message"
    expect(current_path).to eq(messages_path)
    message = Message.first
    date = message.created_at.strftime("%B #{message.created_at.day.ordinalize}, %Y")
    expect(page).to have_content("#{User.first.username} - #{date}")
    expect(page).to have_content(Message.first.message)
  end

  scenario "unsuccessfully creating a message when is blank" do
    # If not created succesfully
    # Current path should equal messages_path (messages#index)
    # Current page should contain error messages (create test for each error except user reference required).
    fill_in "message", with: ""
    click_button "Post a Message"
    expect(current_path).to eq(messages_path)
    expect(page).to have_content("Message can't be blank")
  end

  scenario "unsuccessfully creating a message when is shorter then 10 character" do
    fill_in "message", with: "hello"
    click_button "Post a Message"
    expect(current_path).to eq(messages_path)
    expect(page).to have_content("Message is too short (minimum is 10 characters)")
  end
end
