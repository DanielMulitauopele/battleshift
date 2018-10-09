require 'rails_helper'

feature 'can see single user' do
  scenario 'as a visitor' do
    visit "/users/1"
    
    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("jbarlet@example.com")
  end
end
