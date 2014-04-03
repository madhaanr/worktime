require 'spec_helper'

describe Project do
  let(:project){ FactoryGirl.create(:project) }

  it "is saved" do
    expect(project).to be_valid
    expect(Project.count).to eq(1)
  end

  it "is not saved with too short name" do
    project2 = Project.create name:"ww"

    expect(project2.valid?).to be(false)
    expect(Project.count).to eq(0)
  end
end
