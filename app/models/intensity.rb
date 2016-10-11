class Intensity < ApplicationRecord
  has_many :track_intensities
  has_many :tracks, through: :track_intensities

  validates :level, presence: true, uniqueness: true
end
