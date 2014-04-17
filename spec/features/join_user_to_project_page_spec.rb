require 'spec_helper'
include OwnTestHelper

describe 'Join user to project' do
  let!(:user){ FactoryGirl.create :user }
  let!(:user3){ FactoryGirl.create :user3 }
  let!(:project) { FactoryGirl.create :project }

  it 'can be done when user is normal' do
    sign_in(username:"Marko", password:"1QWErty")

    visit user_projects_path
    #save_and_open_page
    click_link "New User project"
    select('Arto', from:'user_project[user_id]')
    select('Work time', from:'user_project[project_id]')
    click_button "Create User project"

    expect(page).to have_content "User project was successfully created."
  end

  it 'can be done when user is admin' do
    sign_in(username:"Marko", password:"1QWErty")

    visit user_projects_path
    click_link "New User project"
    select('Marko', from:'user_project[user_id]')
    select('Work time', from:'user_project[project_id]')
    click_button "Create User project"

    expect(page).to have_content "User project was successfully created."
  end

  it "can be removed" do
    sign_in(username:"Marko", password:"1QWErty")

    visit user_projects_path
    click_link "New User project"
    select('Marko', from:'user_project[user_id]')
    select('Work time', from:'user_project[project_id]')
    click_button "Create User project"
    visit user_projects_path
    click_link "Destroy"

    expect(page).not_to have_content "Work time"
  end

  it "can be updated" do
    sign_in(username:'Marko', password:'1QWErty')

    visit user_projects_path
    click_link "New User project"
    select('Marko', from:'user_project[user_id]')
    select('Work time', from:'user_project[project_id]')
    click_button 'Create User project'
    visit user_projects_path
    click_link "Edit"
    click_button "Update User project"

    expect(page).to have_content "User project was successfully updated."
  end

  #add test that tests adding allready existing user_id and project_id
  #add test that tests editing user_project to use existing user_id or project_id

end