class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :name
      t.datetime :star_time
      t.string :language
      t.integer :maximum_players

      t.timestamps
    end
  end
end
