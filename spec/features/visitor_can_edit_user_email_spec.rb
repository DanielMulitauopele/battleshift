require 'rails_helper'

feature 'user can edit user email' do
  scenario 'as a visitor' do
    # Title: Build PATCH /api/v1/users/:id
    #
    # API should only support changing a users's email address
    # Title: Edit a user's email address (dogfooding PATCH /api/v1/users/:id)
    #
    # Background: There is a user stored in the database with an id of 1, name of Josiah Bartlet, email of jbartlet@example.com
    #
    # As a guest user
    # When I visit "/users"
    # And I click on `Edit` for Josiah Bartlet
    # Then I should be on "/users/1/edit"
    #
    # When I fill in the email field with "josiah@example.com"
    # And I click "Save"
    # Then I should be on "/users"
    # And I should see a flash message that says "Successfully updated Josiah Bartlet."
    # And I should should see Josiah Bartlet's email show up in the list as "josiah@example.com"
  end
end
