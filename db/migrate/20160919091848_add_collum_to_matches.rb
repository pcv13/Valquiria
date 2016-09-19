class AddCollumToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :completed, :boolean, default: false
    add_column :matches, :mastered, :boolean, default: false
  end
end
