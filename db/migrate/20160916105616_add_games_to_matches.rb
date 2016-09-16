class AddGamesToMatches < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :game, foreign_key: true
  end
end
