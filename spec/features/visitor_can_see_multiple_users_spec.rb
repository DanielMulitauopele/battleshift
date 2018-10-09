require 'rails_helper'

feature 'can see multiple users' do
  scenario 'as a visitor' do
    visit '/users'

    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("jbarlet@example.com")
    expect(page).to have_content("Bob Bobson")
    expect(page).to have_content("bbobson@example.com")
  end
end
