require 'spec_helper'

describe "Projects page" do
  it "should not have any before been created" do
    visit projects_path
    expect(page).to have_content 'Listing projects'
    expect(page).should_not have_content 'Destroy'
  end
end