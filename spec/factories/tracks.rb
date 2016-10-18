require 'factory_girl'

FactoryGirl.define do
  factory :track do
    association :user, factory: :user
    name "Dutty Tune"
    sequence(:filename) { |i| "duttytune#{i}.mp3" }
  end
end