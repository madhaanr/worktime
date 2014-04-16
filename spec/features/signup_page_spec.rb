require 'spec_helper'

describe 'Signup' do

  it 'can be done' do
    visit signup_path

    fill_in('Username', with:'Arto')
    fill_in('Password', with:'1QWE')
    fill_in('Password confirmation', with:'1QWE')
    click_button('Create User')

    expect(page).to have_content 'User was successfully created.'
    expect(page).to have_content 'Arto'
  end

  it 'cant be done with too short password' do
    visit signup_path

    fill_in('Username', with:'Arto')
    fill_in('Password', with:'1QW')
    fill_in('Password confirmation', with:'1QW')
    click_button('Create User')

    expect(page).to have_content 'error prohibited this user from being saved:'
    expect(page).to have_content 'Password is too short (minimum is 4 characters)'
  end

  it 'cant be done with too short username' do
    visit signup_path

    fill_in('Username', with:'Ar')
    fill_in('Password', with:'1QWE')
    fill_in('Password confirmation', with:'1QWE')
    click_button('Create User')

    expect(page).to have_content 'error prohibited this user from being saved:'
    expect(page).to have_content 'Username is too short (minimum is 3 characters)'
  end

  it 'cant be done without matching passwords' do
    visit signup_path

    fill_in('Username', with:'MarttaHilmaTaavi_123!')
    fill_in('Password', with:'1QWE')
    fill_in('Password confirmation', with:'1QWEr')
    click_button('Create User')

    expect(page).to have_content 'error prohibited this user from being saved:'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  it 'cant be done with invalid password(not complex enough)' do
    visit signup_path

    fill_in('Username', with:'Taavitulee')
    fill_in('Password', with:'qwertypower')
    fill_in('Password confirmation', with:'qwertypower')
    click_button('Create User')

    expect(page).to have_content 'error prohibited this user from being saved:'
    expect(page).to have_content 'Password is invalid'
  end

  it 'usernames are unique' do
    visit signup_path

    fill_in('Username', with:'MarttaHilmaTaavi_123!')
    fill_in('Password', with:'1QWErty545')
    fill_in('Password confirmation', with:'1QWErty545')
    click_button('Create User')


    expect(page).to have_content 'User was successfully created.'
    expect(page).to have_content 'MarttaHilmaTaavi_123!'
    visit signup_path

    fill_in('Username', with:'MarttaHilmaTaavi_123!')
    fill_in('Password', with:'1QWE')
    fill_in('Password confirmation', with:'1QWE')
    click_button('Create User')

    expect(page).to have_content 'error prohibited this user from being saved:'
    expect(page).to have_content 'Username has already been taken'

  end


end