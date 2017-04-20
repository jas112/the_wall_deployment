require 'rails_helper'
feature "create message" do
  before(:each) do
		visit "/users/new"
    fill_in "user[first_name]", with: "Leia"
    fill_in "user[last_name]", with: "Organa"
    fill_in "user[email]", with: "leader@skywalkerranch.com"
		click_button "Sign In"
  end

  scenario "successfully creates a message" do
    fill_in "message[message]", with: "This is a message"
    click_button "Post a Message"
    expect(page).to have_current_path("/messages")
    expect(page).to have_content("New Message Posted")
  end

  scenario "doesn't fill out message field" do
    click_button "Post a Message"
    expect(page).to have_current_path("/messages")
    expect(page).to have_content("Message can't be blank")
  end

  scenario "message is under 10 characters" do
    fill_in "message[message]", with: "message"
    click_button "Post a Message"
    expect(page).to have_current_path("/messages")
    expect(page).to have_content("Message is too short (minimum is 10 characters)")
  end

end
