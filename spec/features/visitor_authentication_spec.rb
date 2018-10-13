require 'rails_helper'

feature 'app registration' do
  scenario 'as a visitor' do
    visit '/'

    click_on 'Register'
    expect(current_path).to eq("/register")

    fill_in "Email", with: "daniel@becca.com"
    fill_in "Name", with: "Becca Daniel"
    fill_in "Password", with: "unicorn"
    fill_in "Password confirmation", with: "unicorn"
    click_on "Submit"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as Becca Daniel")
    expect(page).to have_content("This account has not yet been activated. Please check your email.")
  end
  # scenario 'as a user with existing account' do
  #   visit '/'
  #
  #   click_on "I already have an account"
  #   expect(current_path).to eq(login_path)
  #
  #   fill_in "Email", with: "jbarlet@example.com"
  #   fill_in "Password", with: "password"
  #
  #   click_on "Log In"
  #
  #   expect(current_path).to eq(user_path(1))
  #
  #   expect(page).to have_content("Welcome, Josiah Bartlet")
  #   expect(page).to have_content("Log out")
  # end
end
