require "rails_helper"

describe "Edit profile" do
  it "allows a user to edit a profile" do
    user = FactoryGirl.create(:user)
    visit "/"
    expect(page).to have_content("Login")
    click_link "Login"
    fill_in 'Email', :with => 'test@example.com'
    fill_in 'Password', :with => 'f4k3p455w0rd'
    click_on 'Log in'
    expect(page).to have_content("Signed in successfully")
    click_on 'Edit profile'
    fill_in 'Email', :with => 'ian@ian.com'
    fill_in 'Current password', :with => 'f4k3p455w0rd'
    click_on 'Update'
    expect(page).to have_content("updated successfully")
  end
end
