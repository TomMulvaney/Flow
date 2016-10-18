require 'rails_helper'
require 'factory_girl'
require 'shoulda-matchers'

RSpec.describe TrackIntensity, type: :model do
  let(:track_intensity) { FactoryGirl.build(:track_intensity) }
  subject { track_intensity }

  it { should be_valid }
  it { should belong_to(:track) }
  it { should belong_to(:intensity)}
end