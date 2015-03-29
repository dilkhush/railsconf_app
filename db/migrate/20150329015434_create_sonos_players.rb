class CreateSonosPlayers < ActiveRecord::Migration
  def change
    create_table :sonos_players do |t|
      t.datetime :destroyed_at
      t.string :playlist

      t.timestamps
    end
  end
end
