require 'rails_helper'
feature "login" do
  before(:each) do
		visit "/users/new"
    fill_in "user[first_name]", with: "Leia"
    fill_in "user[last_name]", with: "Organa"
    fill_in "user[email]", with: "leia_organa@skywalkerranch.com"
		click_button "Sign In"
    click_button "Logout"
    visit "/"
  end

  scenario "successful login" do
    fill_in "login_email", with: "leia_organa@skywalkerranch.com"
    click_button "Login"
    expect(page).to have_current_path("/messages")
    expect(page).to have_content("Welcome, Leia")
  end

end
