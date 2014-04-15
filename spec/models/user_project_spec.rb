require 'spec_helper'

describe UserProject do
  let(:project){ FactoryGirl.create(:project) }
  let(:user){ FactoryGirl.create(:user) }

  it "is created" do
    user_project = UserProject.create user_id: 1, project_id: 1

    expect(user_project.valid?).to be(true)
    expect(UserProject.count).to eq(1)
  end

end
