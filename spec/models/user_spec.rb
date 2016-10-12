require 'rails_helper'
require 'factory_girl'
require 'bcrypt'

RSpec.describe User, type: :model do
  it "should have valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "should require username" do
    expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
  end

  it "should require email" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end

  it "should require admin?" do
    expect(FactoryGirl.build(:user, admin?: nil)).not_to be_valid
  end

  it "should require passwords to be >= 6 and <=20 characters" do
    expect(FactoryGirl.build(:user, password: "a"*5)).not_to be_valid
    expect(FactoryGirl.build(:user, password: "a"*6)).to be_valid
    expect(FactoryGirl.build(:user, password: "a"*10)).to be_valid
    expect(FactoryGirl.build(:user, password: "a"*20)).to be_valid
    expect(FactoryGirl.build(:user, password: "a"*21)).not_to be_valid
  end

=begin
  describe "encryption and authentication" do
    before(:example) do
      let(:salt) { "$2a$10$yRUmHHKdvlKgkbp27cnndO" }
      let(:encrypted_password) { "DummyEncrytedPassword" }
      let(:user) { FactoryGirl.build(:user) }
      BCrypt::Engine.stubs(:generate_salt).returns(:salt)
    end

    it "clears password" do
      :user.clear_password
      expect(:user.password).to eq(nil)
    end

    it "sets salt" do
      :user.encrypt_password
      expect(:user.salt).to eq(:salt)
    end

    it "calls bcrypt hash_secret" do
      BCrypt::Engine.expects(:hash_secret)#.with(user.password, user.salt) # TODO: Find out why with doesn't work
      :user.encrypt_password
    end

    it "sets encrypted_password" do
      BCrypt::Engine.stubs(:hash_secret).returns(:encrypted_password)
      :user.encrypt_password
      expect(:user.encrypted_password).to eq(:encrypted_password)
    end

    it "matches login password with saved password" do
      :user.encrypted_password = :encrypted_password
      BCrypt::Engine.stubs(:hash_secret).returns(:encrypted_password)
      expect(:user.match_password("NotImportant")).to eq(true)
    end
=end
=begin
    it "calls bcrypt generate_salt" do
      user = FactoryGirl.build(:user)
      BCrypt::Engine.expects(:generate_salt)
      user.encrypt_password
    end
=end

end