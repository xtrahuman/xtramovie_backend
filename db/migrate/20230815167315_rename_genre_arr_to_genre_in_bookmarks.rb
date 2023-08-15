class RenameGenreArrToGenreInBookmarks < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookmarks, :genre_arr, :genre
  end
end
