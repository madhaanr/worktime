require 'spec_helper'
include OwnTestHelper

describe 'User page' do
  let!(:user3){ FactoryGirl.create(:user3) }

  it "can be used to edit password" do
    sign_in(username:"Marko",password:"1QWErty")
    click_link "users"
    expect(page).to have_content "Listing users"
    expect(page).to have_content "Marko"
    click_link "Edit"
    expect(page).to have_content "Editing user"
    fill_in("Password",with: "1QAZ")
    fill_in("Password confirmation", with:"1QAZ")
    click_button "Update User"
    expect(page).to have_content "User was successfully updated."
    expect(page).to have_content "Username: Marko"
  end

  it "can't be used to edit username" do
    sign_in(username:"Marko",password:"1QWErty")
    click_link "users"
    expect(page).to have_content "Listing users"
    expect(page).to have_content "Marko"
    click_link "Edit"
    expect(page).to have_content "Editing user"
    fill_in("Username",with:"QWERTY")
    fill_in("Password",with: "1QAZ")
    fill_in("Password confirmation", with:"1QAZ")
    click_button "Update User"
    expect(page).to have_content "Username cannot be changed"
  end

  it "can be used to destroy user" do
    FactoryGirl.create(:user)
    sign_in(username:"Marko",password:"1QWErty")
    click_link "users"
    expect(page).to have_content "Listing users"
    expect(page).to have_content "Arto"
    #save_and_open_page
    find("table tbody tr:last-child td:last-child a").click
    expect(page).to have_content "Listing users"
    expect(page).to_not have_content "Arto"
  end
end