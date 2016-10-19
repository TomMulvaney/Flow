require 'rails_helper'
require 'factory_girl'

RSpec.describe "manage tracks", type: :feature do
  let(:track) { FactoryGirl.build(:track) }
  subject { track }

  it "creates a track" do
    visit new_track_path
    fill_in "track_name", with: track.name
    attach_file "track_file", Rails.root.join("app", "assets", "audios", "quick_swish.mp3")
  end
end