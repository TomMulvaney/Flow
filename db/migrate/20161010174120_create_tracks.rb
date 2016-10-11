class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :filename

      t.timestamps
    end
  end
end
