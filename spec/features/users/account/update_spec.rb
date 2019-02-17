require "rails_helper"

describe "Update Account" do
  include_context "when user signed in"

  before do
    visit edit_user_registration_path(current_user)
  end

  it "User enters not matched passwords" do
    fill_in :user_password, with: "qwerty"
    fill_in :user_password_confirmation, with: "123123"
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end
end
