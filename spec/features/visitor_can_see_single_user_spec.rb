require 'rails_helper'

feature 'can see single user' do
  scenario 'as a visitor' do
    json_response = File.open("./fixtures/single_user.json")
    stub_request(:get, "https://gentle-reef-11092.herokuapp.com/api/v1/users/1").
    to_return(status: 200, body: json_response)
    visit "/users/1"

    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("jbarlet@example.com")
  end
end
