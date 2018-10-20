require 'rails_helper'

describe AppUser, type: :model do
  it 'exists' do
    attributes = {}
    app_user = AppUser.new(attributes)

    expect(app_user).to be_a(AppUser)
  end

  it 'has attributes' do
    attributes = {id: 1, name: "Rainbow", email: "rainbow@rainbow.com"}
    app_user = AppUser.new(attributes)

    expect(app_user.id).to eq(attributes[:id])
    expect(app_user.name).to eq(attributes[:name])
    expect(app_user.email).to eq(attributes[:email])
  end
end
