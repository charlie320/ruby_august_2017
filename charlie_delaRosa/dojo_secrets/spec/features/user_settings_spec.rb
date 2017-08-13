require 'rails_helper'
feature 'User Settings features ' do
  before do
    @user = create(:user)
    log_in
  end
  feature "User Settings Dashboard" do
    before(:each) do
      visit "/users/#{@user.id}/edit"
    end
    scenario "visit users edit page" do
      expect(page).to have_field('users[name]')
      expect(page).to have_field('users[email]')
      expect(page).to have_field('users[password]')
      expect(page).to have_field('users[password_confirmation]')
    end
    scenario "inputs filled out correctly" do
      expect(find_field('users[name]').value).to eq(@user.name)
      expect(find_field('users[email]').value).to eq(@user.email)
    end
    scenario "incorrectly updates information" do
      fill_in 'users[name]', with: 'Another Name'
      fill_in 'users[email]', with: 'incorrect email format'
      click_button 'Update'
      expect(current_path).to eq("/users/#{@user.id}/edit")
      expect(page).to have_text("Email is invalid")
    end
    scenario "correctly updates information" do
      fill_in 'users[name]', with: 'Another Name'
      fill_in 'users[email]', with: 'correct@email.com'
      click_button 'Update'
      expect(page).to have_text('Another Name')
    end
    scenario "destroys user and redirects to registration page" do
      click_link 'Delete Account'
      expect(current_path).to eq('/users/new')
      # expect(current_path).to eq('/users/destroy')
    end
  end
end
