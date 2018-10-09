require 'rails_helper'

feature 'user can see multiple user index page' do
  scenario 'as a visitor' do
      # As a guest user
    user1 = create(:user)
    user2 = create(:user)
      # When I visit "/users"
    visit "/users"
      # Then I should see the user's name (for both users)
    expect(page).to have_content("All Users")
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
      # And I should see the user's email (for both users)
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
  end
end
