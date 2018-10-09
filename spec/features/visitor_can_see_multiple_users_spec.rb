require 'rails_helper'

feature 'can see multiple users' do
  scenario 'as a visitor' do
    # As a guest user
    visit '/users'
    # When I visit "/users"
    # Then I should see the user's name (for both users)
    # And I should see the user's email (for both users)
    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("jbarlet@example.com")
    expect(page).to have_content("Bob Bobson")
    expect(page).to have_content("bbobson@example.com")
  end
end
