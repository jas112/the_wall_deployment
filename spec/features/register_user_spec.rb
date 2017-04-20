require 'rails_helper'

feature "create user account" do
  before(:each) do
    visit '/users/new'
  end

  scenario "successfully creates a new user account" do
    fill_in "user[first_name]", with: "Luke"
    fill_in "user[last_name]", with: "Skywalker"
    fill_in "user[email]", with: "last_jedi@skywalkerranch.com"
    click_button "Sign In"
    expect(page).to have_content("Welcome, Luke")
  end

  scenario "unsuccessfully creates a new user account" do
    click_button "Sign In"
    expect(page).to have_current_path('/users/new')
  end

  scenario "doesn't fill out first name field" do
    fill_in "user[last_name]", with: "Skywalker"
    fill_in "user[email]", with: "last_jedi@skywalker_ranch.com"
    click_button "Sign In"
    expect(page).to have_content "First name can't be blank"
  end

  scenario "doesn't fill out last name field" do
    fill_in "user[first_name]", with: "Luke"
    fill_in "user[email]", with: "last_jedi@skywalker_ranch.com"
    click_button "Sign In"
    expect(page).to have_content "Last name can't be blank"
  end

  scenario "doesn't fill out email field" do
    fill_in "user[first_name]", with: "Luke"
    fill_in "user[last_name]", with: "Skywalker"
    click_button "Sign In"
    expect(page).to have_content "Email can't be blank"
  end

  scenario "email is not valid" do
    fill_in "user[first_name]", with: "Luke"
    fill_in "user[last_name]", with: "Skywalker"
    fill_in "user[email]", with: "i_am_a_jedi.ranch.com"
    click_button "Sign In"
    expect(page).to have_content "Email is invalid"
  end

end
