require "rails_helper"

describe "Signing up" do
  it "allows a user to sign up for site" do
    visit "/"
    expect(page).to have_content("Sign up")
    click_link "Sign up"

    fill_in "Email",            with: "bob2@bob.com"
    fill_in "Password",         with: "bobpass1"
    fill_in "Password confirmation", with: "bobpass1"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end
end
