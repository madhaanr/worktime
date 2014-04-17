require 'spec_helper'
include OwnTestHelper

describe "Projects page" do

  it "should not have any before been created" do
    visit projects_path
    expect(page).to have_content 'Listing projects'
    expect(page).not_to have_content 'Destroy'
  end

  it "lists the existing projects" do
    FactoryGirl.create(:project)

    visit projects_path
    expect(page).to have_content 'Work time'
    expect(page).to have_content 10
  end

  it "prints error if you try to create project without being signed in" do
    visit projects_path
    click_link 'New Project'
    expect(page).to have_content 'you should be signed in'

  end

  it "prints error if user who is not admin tries to create project" do
    FactoryGirl.create(:user)
    sign_in(username:"Arto",password:"1QWE")
    visit projects_path
    #save_and_open_page
    click_link 'New Project'
    expect(page).to have_content 'operation permitted only for admin users'
  end

  it "admin can create projects" do
    FactoryGirl.create(:user3)
    sign_in(username:"Marko",password:"1QWErty")
    visit projects_path
    #save_and_open_page
    click_link 'New Project'
    fill_in('Name', with:'Work time')
    fill_in('Work hour budget', with:10)
    click_button 'Create Project'
    expect(page).to have_content 'Work time'
    expect(page).to have_content 10
    expect(Project.count).to eq(1)
  end

end