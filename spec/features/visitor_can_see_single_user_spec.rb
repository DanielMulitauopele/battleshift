require 'rails_helper'

feature 'can see single user' do
  scenario 'as a visitor' do
    # As a guest user
    # When I visit "/users/1"
    visit "/users/1"
    # Then I should see the user's name Josiah Bartlet
    # And I should see the user's email address jbartlet@example.com
    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("jbarlet@example.com")
  end
end
