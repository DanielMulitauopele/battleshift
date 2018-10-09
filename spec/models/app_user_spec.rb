require 'rails_helper'

describe AppUser, type: :model do
  it 'exists' do
    attributes = {}
    app_user = AppUser.new(attributes)

    expect(app_user).to be_a(AppUser)
  end
end
