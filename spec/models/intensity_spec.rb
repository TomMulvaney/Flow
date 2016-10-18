require 'rails_helper'
require 'factory_girl'
require 'shoulda-matchers'

RSpec.describe Intensity, type: :model do
  let(:intensity) { FactoryGirl.build(:intensity) }
  subject { intensity }

  it { should be_valid }
  it { should validate_presence_of(:level) }
  it { should validate_uniqueness_of(:level) }
  it { should have_many(:track_intensities) }
  it { should have_many(:tracks).through(:track_intensities) }
end