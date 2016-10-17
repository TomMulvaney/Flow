require 'rails_helper'
require 'factory_girl'

def login (user)
  visit login_path
  within "div#login_form" do
    fill_in "username_or_email", with: user.username
    fill_in "password", with: user.password
    click_on "Login"
  end
end

RSpec.describe "authentication", type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }

  it "logs in successfully" do
    user.password = FactoryGirl.build(:user).password
    login(user)
    expect(current_path).to eq(home_path)
  end

  it "logs in with incorrect password" do
    user.password = "wrong password"
    login(user)
  end
end