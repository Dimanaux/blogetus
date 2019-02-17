require "rails_helper"

feature "As guest I want to create new account" do
  let(:user_attributes) { attributes_for(:user).slice(:email, :password, :password_confirmation) }
  let(:registered_user) { User.find_by(email: user_attributes[:email]) }

  scenario "Guest signs up" do
    visit new_user_registration_path

    fill_in :user_email, with: user_attributes[:email]
    fill_in :user_password, with: user_attributes[:password]
    fill_in :user_password_confirmation, with: user_attributes[:password_confirmation]

    click_button "Sign up"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(registered_user.email)

    visit_in_email("Confirm my account")

    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(page).to have_text("My account")
  end
end
