require 'rails_helper'

feature 'visitor searches for user' do
  scenario 'with valid id' do
    # GET /api/v1/users/:id
    # Background: There is a user stored in the database with an id of 1,
    # name of Josiah Bartlet, email of jbartlet@example.com
    user = create(:user, name: "Josiah Bartlet", email: "jbarlet@example.com")
    # As a guest user
    # When I visit "/users/1"
    visit "/users/1"
    # Then I should see the user's name Josiah Bartlet
    # And I should see the user's email address jbartlet@example.com
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end
