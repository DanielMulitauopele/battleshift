require 'rails_helper'

describe BattleshiftService do
  it 'exists' do
    service = BattleshiftService.new

    expect(service).to be_a(BattleshiftService)
  end

  context 'instance methods' do
    context '#get_users' do
      it 'returns a array' do
        service = BattleshiftService.new

        expect(service.get_users).to be_an(Array)
        expect(service.get_users.first).to have_key(:name)
        expect(service.get_users.first).to have_key(:email)
      end
    end
    context '#get_user' do
      it 'returns a hash' do
        service = BattleshiftService.new

        expect(service.get_user(1)).to be_a(Hash)
        expect(service.get_user(1)).to have_key(:name)
        expect(service.get_user(1)).to have_key(:email)
      end
    end
  end
end
