require 'spec_helper'

describe User do
  it "has username set correctly" do
    user = User.new username:"Pekka"

    user.username.should == "Pekka"
  end

  it "is not saved without password" do
    user = User.create username:"Matti"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "is saved with a proper password" do
    user = User.create username:"Arto",password:"1QWE",password_confirmation:"1QWE"

    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

  it "are saved with a proper password" do
    User.create username:"Taavi",password:"Secret1",password_confirmation:"Secret1"
    User.create username:"Martta",password:"Latua666",password_confirmation:"Latua666"
    User.create username:"Hilma",password:"Maitoa7",password_confirmation:"Maitoa7"

    expect(User.count).to eq(3)
  end

  it "can't be created with too short username" do
    user = User.create username:"Ma",password:"Latua666",password_confirmation:"Latua666"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "can't be created without valid password" do
    user = User.create username:"Martta",password:"Latua",password_confirmation:"Latua"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "can't be created if passwords do not match" do
    user = User.create username:"Martta",password:"Latua666",password_confirmation:"Latua667"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end
end
