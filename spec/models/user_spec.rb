require 'rails_helper'
require 'factory_girl'
require 'bcrypt'
require 'shoulda-matchers'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }
  subject { user }

  it { should be_valid }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password).on(:create) }
  it { should validate_length_of(:password).is_at_least(6).is_at_most(20).on(:create) }

  let(:salt) { "$2a$10$yRUmHHKdvlKgkbp27cnndO" }
  let(:encrypted_password) { "DummyEncrytedPassword" }

  before(:each) do
    BCrypt::Engine.stubs(:generate_salt).returns(salt)
    BCrypt::Engine.stubs(:hash_secret).returns(encrypted_password)
  end

  it "#clear_password" do
    user.clear_password
    expect(user.password).to eq(nil)
  end

  it "#match_password" do
    user.encrypted_password = encrypted_password
    expect(user.match_password("NotImportant")).to eq(true)
  end

  describe "#encrypt_password" do
    it "sets salt" do
      user.encrypt_password
      expect(user.salt).to eq(salt)
    end

    it "calls bcrypt hash_secret" do
      BCrypt::Engine.expects(:hash_secret)#.with(user.password, user.salt) # TODO: Find out why this doesn't work when we use with method
      user.encrypt_password
    end

    it "sets encrypted_password" do
      user.encrypt_password
      expect(user.encrypted_password).to eq(encrypted_password)
    end
  end
end