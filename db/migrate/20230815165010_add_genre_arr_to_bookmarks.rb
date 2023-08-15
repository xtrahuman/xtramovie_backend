class AddGenreArrToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :genre_arr, :string, array: true, default: []
  end
end
