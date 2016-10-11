require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username "Testy McTestface"
    email "test@foo.com"
    admin? false

    password "helloworld" # TODO: This needs to go, we should not need a password

    factory :admin do
      admin? true
    end
  end
end