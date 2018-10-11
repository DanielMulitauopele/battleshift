require 'rails_helper'

describe BattleshiftService do
  it 'exists' do
    service = BattleshiftService.new

    expect(service).to be_a(BattleshiftService)
  end

  context 'instance methods' do
    context '#get_users' do
      it 'returns a array' do
        json_response = File.open("./fixtures/all_users.json")
        stub_request(:get, "http://localhost:3000/api/v1/users").
        to_return(status: 200, body: json_response)
        service = BattleshiftService.new

        expect(service.get_users).to be_an(Array)
        expect(service.get_users.first).to have_key(:name)
        expect(service.get_users.first).to have_key(:email)
      end
    end
    context '#get_user' do
      it 'returns a hash' do
        json_response = File.open("./fixtures/single_user.json")
        stub_request(:get, "http://localhost:3000/api/v1/users/1").
        to_return(status: 200, body: json_response)
        service = BattleshiftService.new

        expect(service.get_user(1)).to be_a(Hash)
        expect(service.get_user(1)).to have_key(:name)
        expect(service.get_user(1)).to have_key(:email)
      end
    end
  end
end
