require 'spec_helper'

describe Task do
  let(:task){ FactoryGirl.create(:task) }

  it "can be saved" do
    expect(task.valid?).to be(true)
    expect(Task.count).to eq(1)
  end

  it "can't be saved with too short name" do
    task = Task.create name: "W2"
    expect(task.valid?).to be(false)
    expect(Task.count).to eq(0)
  end

end
