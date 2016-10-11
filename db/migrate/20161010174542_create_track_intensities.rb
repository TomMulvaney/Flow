class CreateTrackIntensities < ActiveRecord::Migration[5.0]
  def change
    create_table :track_intensities do |t|
      t.references :track, foreign_key: true
      t.references :intensity, foreign_key: true

      t.timestamps
    end
  end
end
