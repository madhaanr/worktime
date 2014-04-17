require 'spec_helper'

describe 'Signin' do
  let(:user){ FactoryGirl.create(:user) }
  let(:user3){ FactoryGirl.create(:user3) }

  it 'can be done with valid username and password' do
    visit signin_path

    expect(user.valid?).to be(true)
    fill_in('username', with:'Arto')
    fill_in('password', with:'1QWE')
    click_button "Log in"
    #save_and_open_page

    expect(page).to have_content 'Arto'
    expect(page).to have_content 'Listing projects'
  end

  it "can't be done with invalid username" do
    visit signin_path

    expect(user.valid?).to be(true)
    fill_in('username', with:'Art')
    fill_in('password', with:'1QWE')
    click_button "Log in"

    expect(current_path).to eq(signin_path)
    expect(page).to have_content 'Username and/or password mismatch'
  end

   it "can't be done with invalid password" do
    visit signin_path

    expect(user.valid?).to be(true)
    fill_in('username', with:'Arto')
    fill_in('password', with:'1QWEr')
    click_button "Log in"

    expect(current_path).to eq(signin_path)
    expect(page).to have_content 'Username and/or password mismatch'
  end

  it 'can be done with admin account' do
    visit signin_path

    expect(user3.valid?).to be(true)
    fill_in('username', with:'Marko')
    fill_in('password', with:'1QWErty')
    click_button "Log in"

    expect(page).to have_content 'Marko'
    expect(page).to have_content 'Listing projects'
  end
end