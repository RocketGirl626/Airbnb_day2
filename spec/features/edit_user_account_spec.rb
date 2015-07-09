require "rails_helper"

describe "Edit profile" do
  before do
    user = FactoryGirl.create(:user)
    sign_in user
    it "allows a user to edit a profile" do
      visit "/"
      expect(page).to have_content("Login")
      click_link "Login"
      expect(page).to have_content("Signed in successfully")
      click_on 'Edit Profile'
      fill_in 'Email', :with => 'ian@ian.com'
      fill_in 'Current password', :with => 'f4k3p455w0rd'
      click_on 'Update'
      expect(page).to have_content("updated successfully")
    end
  end
end
