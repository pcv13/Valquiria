class AddCollumnMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :owner_id, :integer
  end
end
