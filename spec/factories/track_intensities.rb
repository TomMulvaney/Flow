require 'factory_girl'

FactoryGirl.define do
  factory :track_intensity do
    association :track, factory: :track
    association :intensity, factory: :intensity
  end
end