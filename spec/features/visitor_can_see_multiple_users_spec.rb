require 'rails_helper'

feature 'can see multiple users' do
  scenario 'as a visitor' do
    json_response = File.open("./fixtures/all_users.json")
    stub_request(:get, "https://gentle-reef-11092.herokuapp.com/api/v1/users").
    to_return(status: 200, body: json_response)
    visit '/users'

    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("jbarlet@example.com")
    expect(page).to have_content("Bob Bobson")
    expect(page).to have_content("bbobson@example.com")
  end
end
