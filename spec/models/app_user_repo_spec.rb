require 'rails_helper'

describe AppUserRepo do
  it "exists" do
    repo = AppUserRepo.new

    expect(repo).to be_a(AppUserRepo)
  end

  describe 'instance methods' do
    describe 'app_users' do
      it "returns a collection of users" do
        repo = AppUserRepo.new

        expect(repo.app_users).to be_an(Array)
        expect(repo.app_users.first).to be_an(AppUser)
      end
    end
    describe 'app_user' do
      it "returns a single user" do
        repo = AppUserRepo.new

        expect(repo.app_user(1)).to be_an(AppUser)
      end
    end
  end
end
