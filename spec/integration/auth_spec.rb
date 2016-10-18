require 'rails_helper'
require 'factory_girl'

def login (user)
  visit login_path
  within "div.login_form" do
    fill_in "username_or_email", with: user.username
    fill_in "password", with: user.password
    click_on "Login"
  end
end

def get_password
  FactoryGirl.build(:user).password
end

RSpec.describe "authentication", type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }

  it "logs in successfully" do
    user.password = get_password()
    login(user)
    expect(current_path).to eq(home_path)
  end

  it "logs in with incorrect password" do
    user.password = "wrong password"
    login(user)
    expect(current_path).to eq(sessions_login_attempt_path)
  end

  it "logs out" do
    user.password = get_password()
    login(user)
    click_on("Logout")
    expect(current_path).to eq(root_path)
  end

  it "allows user to navigate to signup from login" do
    visit login_path
    click_on("Signup")
    expect(current_path).to eq(new_user_path)
  end

  it "registers a valid user" do
    visit new_user_path
    user.password = get_password()
    within "div.signup_form" do
      fill_in "user_username", with: "UniqueUsername" # Username must be unique
      fill_in "user_email", with: "uniqueemail@foo.com" # Email must be unique
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password
      click_on("Signup")
      expect(current_path).to eq(home_path)
    end
  end

  it "registers an invalid user" do
    visit new_user_path
    user.password = get_password()
    within "div.signup_form" do
      click_on("Signup")
      expect(current_path).to eq(users_path)
    end
  end

  it "allows user to navigate to login from signup" do
    visit new_user_path
    click_on("Already have an account")
    expect(current_path).to eq(login_path)
  end
end