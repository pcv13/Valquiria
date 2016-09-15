class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :name
      t.datetime :star_time

      t.timestamps
    end
  end
end
