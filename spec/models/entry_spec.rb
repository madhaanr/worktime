require 'spec_helper'

describe Entry do
  let(:project){ FactoryGirl.create(:project) }
  let(:user){ FactoryGirl.create(:user) }
  let(:task){ FactoryGirl.create(:task) }


  it "can be created" do
    user_project = UserProject.create user_id: 1, project_id: 1
    expect(user_project.valid?).to be(true)
  end
end
