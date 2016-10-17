require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username "Testy McTestface"
    email "test@foo.com"
    admin? false

    password "helloworld"

    factory :admin do
      admin? true
    end
  end
end