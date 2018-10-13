require 'rails_helper'

feature 'visitor can register with app' do
  scenario 'as a user' do
    # When I visit "/"
    visit '/'
    # And I click "Register"
    click_on 'Register'
    # Then I should be on "/register"
    expect(current_path).to eq("/register")
    # And when I fill in an email address (required)
    fill_in "Email", with: "daniel@becca.com"
    # And I fill in name (required)
    fill_in "Name", with: "Becca Daniel"
    # And I fill in password and password confirmation (required)
    fill_in "Password", with: "unicorn"
    fill_in "Password confirmation", with: "unicorn"
    # And I click submit
    click_on "Submit"
    # Then I should be redirected to "/dashboard"
    expect(current_path).to eq("/dashboard")
    # And I should see a message that says "Logged in as <SOME_NAME>"
    expect(page).to have_content("Logged in as Becca Daniel")
    expect(page).to have_content("This account has not yet been activated. Please check your email.")
    # And I should see "This account has not yet been activated. Please check your email."
  end
end
