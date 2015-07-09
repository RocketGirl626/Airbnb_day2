require "rails_helper"

describe "Signing up" do
  it "allows a user to add a property to the site" do
    user = FactoryGirl.create(:user)
    visit "/"
    expect(page).to have_content("Login")
    click_link "Login"
    fill_in 'Email', :with => 'test@example.com'
    fill_in 'Password', :with => 'f4k3p455w0rd'
    click_on 'Log in'
    expect(page).to have_content("Signed in successfully")
    click_on 'Add a New Property'
    fill_in 'Name', :with => 'my house'
    fill_in 'Description', :with => 'this is a great house'
    click_on 'Create Property'
    expect(page).to have_content("my house")
  end
end
