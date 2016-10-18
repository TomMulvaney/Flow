require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |i| "TestyMcTestface#{i}" }
    sequence(:email) { |i| "test#{i}@foo.com" }
    admin? false

    password "helloworld"

    factory :admin do
      admin? true
    end
  end
end