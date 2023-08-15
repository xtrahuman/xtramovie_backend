class RemoveGenreFromBuys < ActiveRecord::Migration[7.0]
  def change
    remove_column :buys, :genre, :string
  end
end
