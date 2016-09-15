class CreateMatchPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :match_players do |t|
      t.references :player, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
