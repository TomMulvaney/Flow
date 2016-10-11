class Track < ApplicationRecord
  belongs_to :user
  has_many :track_intensities
  has_many :intensities, through: :track_intensities

  validates :filename, presence: true, uniqueness: true
end
