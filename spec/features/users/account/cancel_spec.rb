require "rails_helper"

describe "Cancel Account" do
  include_context "when user signed in"

  let(:user) { User.find_by(email: current_user.email) }

  before do
    visit edit_user_registration_path(current_user)
  end

  it "User cancels account" do
    click_link "I want to remove my account with all data!"

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")

    expect(user).to be nil
  end
end
