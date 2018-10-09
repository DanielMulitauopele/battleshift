require 'rails_helper'

feature 'as a visitor' do
  scenario 'can see single user show page' do
      # As a guest user
    user = create(:user)
      # When I visit "/users/1"
    visit "/users/#{user.id}"
      # Then I should see the user's name Josiah Bartlet
    expect(page).to have_content(user.name)
      # And I should see the user's email address jbartlet@example.com
    expect(page).to have_content(user.email)
  end
end
