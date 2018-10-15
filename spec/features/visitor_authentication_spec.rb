require 'rails_helper'

feature 'app registration' do
  scenario 'as a visitor' do
    visit '/'

    click_on 'Register'
    expect(current_path).to eq("/register")

    fill_in "Name", with: "Becca Daniel"
    fill_in "Email", with: "daniel@becca.com"
    fill_in "Password", with: "unicorn"
    fill_in "Password confirmation", with: "unicorn"
    click_on "Submit"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Please check your email to activate your account.")
  end
  scenario 'as a user with existing activated account' do
    existing_user = User.create!(name: "Bec", email: "hi@hi.com", password: "x", activated: true)
    visit '/'

    click_on "I already have an account"
    expect(current_path).to eq(login_path)

    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password

    VCR.use_cassette("active_log_in") do
      click_on "Log In"
    end

    expect(current_path).to eq(user_path(existing_user))
    expect(page).to have_content("Logged in as: Bec")
    expect(page).to have_content("Welcome, Bec")
    # expect(page).to have_content("Log out")
    #commenting the above line out, pending completion of other project requirements
  end

  scenario 'as a user with unactivated account' do
    existing_user = User.create!(name: "Bec", email: "hi@hi.com", password: "x", activated: false)
    visit '/'

    click_on "I already have an account"
    expect(current_path).to eq(login_path)

    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password

    VCR.use_cassette("inactive_log_in") do
      click_on "Log In"
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content("This account has not yet been activated")
  end
end
