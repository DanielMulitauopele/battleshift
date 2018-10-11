require 'rails_helper'

describe AppUserRepo do
  it "exists" do
    repo = AppUserRepo.new

    expect(repo).to be_a(AppUserRepo)
  end

  describe 'instance methods' do
    describe 'app_users' do
      it "returns a collection of users" do
        json_response = File.open("./fixtures/all_users.json")
        stub_request(:get, "https://gentle-reef-11092.herokuapp.com/api/v1/users").
        to_return(status: 200, body: json_response)
        repo = AppUserRepo.new

        expect(repo.app_users).to be_an(Array)
        expect(repo.app_users.first).to be_an(AppUser)
      end
    end
    describe 'app_user' do
      it "returns a single user" do
        json_response = File.open("./fixtures/single_user.json")
        stub_request(:get, "https://gentle-reef-11092.herokuapp.com/api/v1/users/1").
        to_return(status: 200, body: json_response)
        repo = AppUserRepo.new

        expect(repo.app_user(1)).to be_an(AppUser)
      end
    end
  end
end
