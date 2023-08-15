class RemoveGenreFromBookmarks < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookmarks, :genre, :string
  end
end
