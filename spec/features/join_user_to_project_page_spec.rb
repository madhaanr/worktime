require 'spec_helper'
include OwnTestHelper

describe 'Join user to project' do
  let!(:user){ FactoryGirl.create :user }
  let!(:user3){ FactoryGirl.create :user3 }
  let!(:project) { FactoryGirl.create :project }
  let!(:task){ FactoryGirl.create :task }

  it 'can be done' do
    sign_in(username:"Marko", password:"1QWErty")
    visit user_projects_path
    save_and_open_page
    expect(page).to have_content 'Marko'
  end


end