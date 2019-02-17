require "rails_helper"

describe "Password Reset" do
  let(:new_password) { "qwe123" }
  let(:user) { create :user }

  def update_password
    fill_in :user_password, with: new_password
    fill_in :user_password_confirmation, with: new_password
    click_button "Change password"
  end

  it "Visitor resets his password" do
    visit new_user_session_path

    click_link "Forgot your password?"

    fill_in :user_email, with: user.email
    click_button "Send me reset password instructions"

    open_email(user.email)

    expect(current_email).to have_subject("Reset password instructions")
    expect(current_email).to have_body_text(user.email)

    visit_in_email("Change my password")
    update_password

    expect(page).to have_content("Your password has been changed successfully")
  end
end
