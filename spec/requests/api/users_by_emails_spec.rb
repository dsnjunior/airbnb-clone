require "rails_helper"

RSpec.describe "Api::UsersByEmails", type: :request do
  describe "GET show" do
    let(:headers) do
      { "Accept" => "application/json" }
    end

    context "user exists" do
      it "is successful" do
        user = create(:user)
        get api_users_by_email_path, params: { email: user.email }, headers: headers
        expect(response).to be_successful
      end
    end

    context "user does not exist" do
      it "is not found" do
        get api_users_by_email_path, params: { email: "invalid@email.com" }, headers: headers
        expect(response.status).to eq 404
      end
    end
  end
end
