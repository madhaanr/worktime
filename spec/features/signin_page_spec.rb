require 'spec_helper'

describe 'Signin' do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:user3){ FactoryGirl.create(:user3) }

  it 'can be done with valid username and password' do
    sign_in(username:"Arto",password:"1QWE")
    expect(page).to have_content 'Arto'
    expect(page).to have_content 'Listing projects'
  end

  it "can't be done with invalid username" do
    sign_in(username:"Art",password:"1QWE")
    expect(current_path).to eq(signin_path)
    expect(page).to have_content 'Username and/or password mismatch'
  end

   it "can't be done with invalid password" do
    sign_in(username:"Arto",password:"1QWEr")
    expect(current_path).to eq(signin_path)
    expect(page).to have_content 'Username and/or password mismatch'
  end

  it 'can be done with admin account' do
    sign_in(username:"Marko",password:"1QWErty")
    expect(page).to have_content 'Marko'
    expect(page).to have_content 'Listing projects'
  end
end