require "rails_helper"

RSpec.describe AccountVerifierMailer, type: :mailer do
  before(:each) do
    @user = create(:user)
  end
  describe "account_activation" do

    let(:mail) { AccountVerifierMailer.account_activation(@user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Hello #{@user.name}, activate your Battleshift Account!")
      expect(mail.to).to eq(["#{@user.email}"])
      expect(mail.from).to eq(["no-reply@battleshift.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
