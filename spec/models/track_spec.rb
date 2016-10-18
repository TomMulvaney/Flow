require 'rails_helper'
require 'factory_girl'
require 'shoulda-matchers'

RSpec.describe Track, type: :model do
  let(:track) { FactoryGirl.build(:track) }
  subject { track }

  it { should be_valid }
  it { should belong_to(:user) }
  it { should have_many(:track_intensities) }
  it { should have_many(:intensities).through(:track_intensities) }
  it { should validate_presence_of(:filename) }
  it { should validate_uniqueness_of(:filename) }
end