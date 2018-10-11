require 'rails_helper'

feature 'user can edit user email' do
  scenario 'as a visitor' do
    VCR.use_cassette("visit_users") do
      visit '/users'
    end
    within(".user-1") do
      click_on("Edit")
    end
    expect(current_path).to eq("/users/1/edit")
    fill_in :email, with: "josiah@example.com"
    
    VCR.use_cassette("edit_user") do
      click_on("Save")
    end
    expect(current_path).to eq("/users")
    expect(page).to have_content("Successfully updated Josiah Bartlet.")
    expect(page).to have_content("josiah@example.com")
  end
end
