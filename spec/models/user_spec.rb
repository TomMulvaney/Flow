require 'rails_helper'
require 'factory_girl'

RSpec.describe User, type: :model do
  it "should have valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "should require a username" do
    expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
  end
end